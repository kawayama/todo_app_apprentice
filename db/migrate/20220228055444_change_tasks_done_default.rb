class ChangeTasksDoneDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :is_done, false
  end
end
