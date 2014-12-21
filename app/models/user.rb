class User < ActiveRecord::Base
 has_and_belongs_to_many :tasks
 validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
 validates :password, presence: true, length: 6..16

end
