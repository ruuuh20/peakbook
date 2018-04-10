class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :course_id, :date
  belongs_to :course
  has_many :grades
  has_many :students, through: :grades
end
