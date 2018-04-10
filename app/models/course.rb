class Course < ApplicationRecord
  has_many :assignments
  has_many :grades
  has_many :enrollments
  has_many :students, through: :enrollments

end
