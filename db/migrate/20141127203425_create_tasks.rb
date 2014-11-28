class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name
      t.integer :project_id
      t.timestamps
    end
  end
end
