class CreateColumnCompleteTaskBool < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :task_completed, :boolean, default: false
  end
end
