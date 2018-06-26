class GradesController < ApplicationController

  before_action :authenticate_user!

  def index
      @course = Course.find(params[:course_id])
    if current_user.admin?
        @course_grades = @course.grades.all
      @grades = Grade.all
      @grades_hash = Grade.grouped
      # @assignments = []
      # @grades_hash.each do |key, value|
      #   @assignments << Assignment.find_by_id(key)
      #
      # end
      @assignments = @course.assignments.all
    else
      @grades = current_user.grades.all
    end
  end

  def new
    @grade = Grade.new
    @course = Course.find(params[:course_id])
    @assignments = @course.assignments.all
  end

# for grouped selecting assignment in form
    # <%= f.grouped_collection_select(:assignment_id, Student.order(:first_name), :assignments, :first_name, :id, :name) %>

  # def new_with_student
  #   # @grade = Grade.new
  #   # @student =
  # end

  def create
    @course = Course.find(params[:course_id])
    @student = Student.find(params["grade"][:student_id])
    @assignment = Assignment.find(params["grade"][:assignment_id])


      # if !@student.student_assignments_total.include?(@assignment)
      #   flash[:error] = "Student and Assignment do not match"
      #   redirect_to new_grade_path
      # else

        @grade = Grade.create(grade_params)
        @grade.course_id = @course.id
          if @grade.save
                    @grade.assignment_id = params["grade"]["assignment_id"]
                    @grade.student_id = params["grade"][:student_id]
                    flash[:notice] = "Grade was added succesfully."
                    redirect_to course_path(@course)
            else
                    # binding.pry
                    flash[:error] = "There was an error"
                    render 'grades/new'
            end
      # end
    end

    private
      def grade_params
        params.require(:grade).permit(:score, :assignment_id, :student_id, :course_id)
      end

end
