class ChangeTitleToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :title, :name
  end
end
