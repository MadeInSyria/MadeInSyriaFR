class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :authorized_user, only: [:destroy, :edit]

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 5)
    @featured = Category.find_by(name: "featured").posts.friendly.find(:all, :order => "created_at DESC", :limit => 3)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    if params[:post][:excerpt].empty?
      params[:post][:excerpt] = build_excerpt(params[:post][:content])
    end
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    if params[:post][:excerpt].empty?
      params[:post][:excerpt] = build_excerpt(params[:post][:content])
    end
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.friendly.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_url
  end

  def admin
    @posts = Post.paginate(page: params[:page])
  end

  def feed
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :illustration, {:category_ids => []}, :excerpt)
    end

  def authorized_user
    @post = Post.friendly.find(params[:id]).user_id
    if !current_user?(@post) && !current_user.admin?
      redirect_to(root_url)
    end
  end

  def build_excerpt(text, max_sentences = 8, max_words = 450)
    three_sentences = text.split('. ').slice(0, max_sentences).join('. ')
    shortened = three_sentences.split(' ').slice(0, max_words).join(' ')
    shortened = Nokogiri::HTML::DocumentFragment.parse(shortened).to_html
    return shortened
  end
end