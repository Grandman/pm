class Task < ActiveRecord::Base
 belongs_to :project
 has_and_belongs_to_many :users
 has_many :children, class_name: "Task", foreign_key: "parent_id", :dependent => :destroy
 belongs_to :parent, class_name: "Task"
 def self.without_parent
   Task.where(parent: nil)
 end
 def self.completed
   Task.where(completed: true)
 end
end
