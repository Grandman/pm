class AddParentToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :parent, index: true
  end
end
