class Project < ActiveRecord::Base
 has_many :tasks, dependent: :destroy
 validates :name, presence: true, length: 6..30
end
