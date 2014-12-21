class Task < ActiveRecord::Base
 belongs_to :project
 has_and_belongs_to_many :users
 has_many :children, class_name: "Task", foreign_key: "parent_id", :dependent => :destroy
 belongs_to :parent, class_name: "Task"

 validates :name, presence: true, length: 3..30
 validates :project, presence: true

 scope :not_completed, -> { where(completed: nil)}
 scope :without_parent, -> { where(parent: nil)}
 scope :find_completed, ->(project) { where(project: project,completed: true)} 

end
