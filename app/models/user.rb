class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: true
  validates :location, presence: true, length: { maximum: 50 }
  has_secure_password
  
  has_many :courses_users,dependent: :destroy
  has_many :courses, through: :courses_users
  
  has_many :nows
  has_many :now_courses, through: :nows, class_name: 'Course', source: :course
  
  def now(course)
    self.nows.find_or_create_by(course_id: course.id)
  end

  def unnow(course)
    now = self.nows.find_by(course_id: course.id)
    now.destroy if now
  end

  def now?(course)
    self.now_courses.include?(course)
  end
  
end
