class Course < ApplicationRecord
  has_many :assignments
  has_many :grades
  has_many :registrations
  has_many :students, through: :registrations

end
