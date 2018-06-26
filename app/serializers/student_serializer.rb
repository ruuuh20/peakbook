class StudentSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :first_name
  has_many :grades
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :assignments, through: :grades
end
