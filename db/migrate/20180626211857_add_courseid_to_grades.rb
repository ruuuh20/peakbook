class AddCourseidToGrades < ActiveRecord::Migration[5.1]
  def change
    add_column :grades, :course_id, :integer
  end
end
