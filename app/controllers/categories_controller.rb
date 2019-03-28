class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(params[:category])
    redirect_to category_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])

    if category.update(categories_params)
    redirect_to category_path(category)

    else 
      redirect :edit 
    end 
  end

  def categories_params 
    params.require(:category).permit(:name)
  end 
end
