class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_tasks = @category.tasks
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

  def done
    category = Category.find(params[:id])
    tasks = category.tasks
    tasks.each do |task|
      task.update(is_done: true)
    end
    redirect_to category
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
