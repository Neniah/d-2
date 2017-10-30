class AddColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :name, :string
    add_reference :projects, :user, foreign_key: true
  end
end
