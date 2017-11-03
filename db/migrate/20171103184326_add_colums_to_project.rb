class AddColumsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :description, :text
    add_column :projects, :due_on, :date
    add_column :projects, :completed, :boolean
  end
end
