class Course < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :courses_users
  has_many :users, through: :courses_users
  
  has_many :nows
  has_many :now_users, through: :nows, class_name: 'User', source: :user
  
end
