class RemoveTextColumnFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :text, :string
  end
end
