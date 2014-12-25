class AddStartAtToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :start_at, :datetime
  end
end
