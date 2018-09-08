class CoursesUser < ApplicationRecord
  belongs_to :user , touch: true
  belongs_to :course
end
