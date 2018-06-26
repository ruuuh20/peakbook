# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course1 = Course.create(:name => "English A", :start_date => Date.parse("2017-02-01"), :code => 123)
course2 = Course.create(:name => "Math A", :start_date => Date.parse("2017-02-01"), :code => 456)
course3 = Course.create(:name => "Writing A", :start_date => Date.parse("2017-04-01"), :code => 202)
course4 = Course.create(:name => "Math B", :start_date => Date.parse("2017-05-01"), :code => 111)
course5 = Course.create(:name => "Testing3", :start_date => Date.parse("2017-08-01"), :code => 800)
course6 = Course.create(:name => "Testing4", :start_date => Date.parse("2017-09-01"), :code => 934)

# student1 = Student.create(:last_name => "Messi", :first_name => "Lionel")
# student2 = Student.create(:last_name => "Neymar", :first_name => "Neymar")
# student3 = Student.create(:last_name => "Ronaldo", :first_name => "Cristiano")
# student4 = Student.create(:last_name => "Pogba", :first_name => "Paul")
# student5 = Student.create(:last_name => "Griezmann", :first_name => "Antoine")
# student6 = Student.create(:last_name => "Hazard", :first_name => "Eden")


enrollment1 = Enrollment.create(:student_id => 1, :course_id => 1)
enrollment2 = Enrollment.create(:student_id => 1, :course_id => 2)
enrollment3 = Enrollment.create(:student_id => 2, :course_id => 3)
enrollment4 = Enrollment.create(:student_id => 3, :course_id => 1)
enrollment5 = Enrollment.create(:student_id => 4, :course_id => 2)
enrollment6 = Enrollment.create(:student_id => 5, :course_id => 4)

assignment1 = Assignment.create(:name => "essay 1", :date => Date.parse("2017-03-20"), :course_id => 1)
assignment2 = Assignment.create(:name => "exam a", :date => Date.parse("2017-04-20"), :course_id => 2)
assignment3 = Assignment.create(:name => "exam b", :date => Date.parse("2017-05-20"), :course_id => 3)
assignment4 = Assignment.create(:name => "essay c", :date => Date.parse("2017-05-20"), :course_id => 4)
assignment5 = Assignment.create(:name => "quiz", :date => Date.parse("2017-04-20"), :course_id => 5)
assignment6 = Assignment.create(:name => "essay", :date => Date.parse("2017-09-20"), :course_id => 6)

grade1 = Grade.create(:score => 90, :assignment_id => 1, :student_id => 1)
grade2 = Grade.create(:score => 50, :assignment_id => 3, :student_id => 2)
grade3 = Grade.create(:score => 50, :assignment_id => 4, :student_id => 5)
grade4 = Grade.create(:score => 30, :assignment_id => 2, :student_id => 1)
grade5 = Grade.create(:score => 85, :assignment_id => 1, :student_id => 3)
grade6 = Grade.create(:score => 85, :assignment_id => 2, :student_id => 4)
