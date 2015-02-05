class Task < ActiveRecord::Base
 has_ancestry
 belongs_to :project
 has_and_belongs_to_many :users

 validates :name, presence: true, length: 3..30
 validates :project, presence: true
 validates :end_at, presence: true
 validates :start_at, presence: true
 validate :end_at_cannot_be_less_then_started_at
 validate :compare_datetimes_with_project

 scope :not_completed, -> { where(completed: nil)}
 scope :find_completed, ->(project) { where(project: project,completed: true)} 

 private
 def compare_datetimes_with_project
  if parent.present?
    if end_at >= parent.end_at
       errors.add(:end_at, "can't end later than parent task")
    end
    if start_at <= parent.start_at
       errors.add(:start_at, "can't start earlier than parent task")
    end
  end
 end
 def end_at_cannot_be_less_then_started_at 
    return if end_at.blank? || created_at.blank?
    if end_at < created_at
      errors.add(:end_at, "can't end earlier than created")
    end
 end 
end
