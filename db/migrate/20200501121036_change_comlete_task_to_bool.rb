class ChangeComleteTaskToBool < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :task_completed
  end
end
