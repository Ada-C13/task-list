class RenameCompleteAtToCompletedAt < ActiveRecord::Migration[6.0]
  def change
    rename_column(:tasks, :complete_at, :completed_at)
  end
end
