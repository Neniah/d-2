class AddColumnsToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :message, :text
    add_reference :notes, :user, foreign_key: true
    add_reference :notes, :project, foreign_key: true
  end
end
