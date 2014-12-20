class AddDescriptionEndAtToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :end_at, :datetime
  end
end
