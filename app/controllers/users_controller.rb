class UsersController < ApplicationController
  def new
    @user = User.new
  end

  #Display user
  def show
    @user = User.find(params[:id])
  end

  #User creation
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

  #Required params
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
