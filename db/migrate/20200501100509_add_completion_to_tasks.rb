class AddCompletionToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :task_completed, :string
  end
end
