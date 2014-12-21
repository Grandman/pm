class Task < ActiveRecord::Base
 belongs_to :project
 has_and_belongs_to_many :users
 has_many :children, class_name: "Task", foreign_key: "parent_id", :dependent => :destroy
 belongs_to :parent, class_name: "Task"

 validates :name, presence: true, length: 3..30
 validates :project, presence: true
 validates :end_at, presence: true
 validate :end_at_cannot_be_less_then_created_at

 scope :not_completed, -> { where(completed: nil)}
 scope :without_parent, -> { where(parent: nil)}
 scope :find_completed, ->(project) { where(project: project,completed: true)} 

 private

 def end_at_cannot_be_less_then_created_at 
    return if end_at.blank? || created_at.blank?
    if end_at < created_at
      errors.add(:end_at, "can't end earlier than created")
    end
 end 
end
