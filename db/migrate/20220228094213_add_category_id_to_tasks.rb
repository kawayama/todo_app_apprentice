class AddCategoryIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :category, null: false, index: true
  end

  def down
    remove_reference :tasks, :category, index: true
  end
end
