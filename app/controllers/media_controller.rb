class MediaController < ApplicationController
  before_action :authorized_user

  def new
    @media = Medium.new
  end

  def create
    @media = Medium.new(post_params)
    if @media.save
      flash[:success] = "Media added"
      redirect_to @media
    else
      render 'new'
    end
  end

  def show
    @media = Medium.find(params[:id])
  end

  def index
    @media = Medium.paginate(page: params[:page], :per_page => 10)
  end

  def edit
    @media = Medium.find(params[:id])
  end

  def update
    @media = Medium.find(params[:id])
    if @media.update_attributes(post_params)
      flash[:success] = "Media updated"
      redirect_to @media
    else
      render 'edit'
    end
  end

  def destroy
    Medium.find(params[:id]).destroy
    flash[:success] = "Media deleted."
    redirect_to media_url
  end

  private
    def authorized_user
      if !current_user.admin?
        redirect_to(root_url)
      end
    end

    def post_params
      params.require(:medium).permit(:image, :name)
    end

end
