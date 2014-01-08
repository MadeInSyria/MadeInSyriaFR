class CategoriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :authorized_user, only: [:destroy, :edit]

  def index
    @categories = Category.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
