class AddEndToToProject < ActiveRecord::Migration
  def change
    add_column :projects, :end_at, :datetime
  end
end
