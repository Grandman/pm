class Task < ActiveRecord::Base
 belongs_to :project
 has_and_belongs_to_many :users
 has_many :children, class_name: "Task", foreign_key: "parent_id", :dependent => :destroy
 belongs_to :parent, class_name: "Task"
 validates :name, presence: true, length: 3..30
 validates :project, presence: true
 def self.not_completed
    Task.where(completed: nil)
 end
 def self.without_parent
   Task.where(parent: nil)
 end
 def self.find_completed (project)
   Task.where(project: project,completed: true)
 end
end
