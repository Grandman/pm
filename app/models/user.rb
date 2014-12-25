class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 has_and_belongs_to_many :tasks
 validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
 validates :password, presence: true, length: 6..16

end
