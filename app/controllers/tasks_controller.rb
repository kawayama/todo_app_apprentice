class TasksController < ApplicationController
  def add
    @category = Category.find_by(id: params[:id])
    @cnt = params[:cnt].to_i
    @cnt = @cnt - 1
  end

  def update
    category = Category.find(params[:id])

    tasks_params.each do |task_key, task_value|
      if task_key.to_i > 0
        Task.find_by(id: task_key.to_i).update(is_done: task_value[:is_done], name: task_value[:name])
        puts "update id: #{task_key}, is_done: #{task_value[:is_done]}, name: #{task_value[:name]}"
      elsif not task_value[:name].empty?
        Task.create(is_done: task_value[:is_done], name: task_value[:name], category_id: category.id)
        puts "create is_done: #{task_value[:is_done]}, name: #{task_value[:name]}"
      end
    end

    redirect_to category
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    category = Category.find(params[:category_id])
    redirect_to category
  end

  private

  def tasks_params
    params.require(:tasks)
  end
end
