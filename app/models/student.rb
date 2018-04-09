class Student < ApplicationRecord
  has_many :grades
  has_many :courses
  has_many :assignments, through: :grades

  def courses_attributes=(course_attributes)
  course_attributes.values.each do |course_attribute|
    course = Course.find_or_create_by(course_attribute)
    # self.courses.build(course_attributes)
    self.courses << course unless course.name.empty?
  end
end

  def student_assignments_total
    self.courses.each do |course|
      course.assignments.each do |assignment|
      self.assignments << assignment
    end

  end
  self.assignments.map{|n| n}
end
end
