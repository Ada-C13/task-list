class ChangeCompletedAtToBeDate < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :completed_at, :date, using: 'completed_at::date'
  end
end
