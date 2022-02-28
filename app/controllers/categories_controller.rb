class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_tasks = @category.tasks.order(created_at: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.save!
    redirect_to categories_url
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update!(category_params)
    redirect_to categories_url
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
