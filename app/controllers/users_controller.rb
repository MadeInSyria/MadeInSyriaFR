class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :authorized_user, only: [:edit, :update, :destroy]
  before_filter :is_admin, only: [:new, :create]


  #Display user
  def show
    @user = User.friendly.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  #Display all the users
  def index
    @users = User.paginate(page: params[:page])
  end

  #User creation
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the MadeInSyria.fr!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Update user
  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #Delete a user
  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
    #Required params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :about)
    end

    def authorized_user
      @user = User.friendly.find(params[:id])
      if !current_user?(@user) && !current_user.admin?
        redirect_to(root_url)
      end
    end

    def is_admin
      if !current_user.admin?
        redirect_to(root_url)
      end
    end
  end