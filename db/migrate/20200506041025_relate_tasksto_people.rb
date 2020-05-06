class RelateTaskstoPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :person, index: true
  end
end
