class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :course_id
  belongs_to :student
  belongs_to :course
end
