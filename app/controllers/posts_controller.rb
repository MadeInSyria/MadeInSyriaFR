class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :authorized_user, only: [:edit]

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def admin
    @posts = Post.paginate(page: params[:page])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :illustration)
    end
end