class GradesController < ApplicationController

  def index
    if current_user.admin?
      @grades = Grade.all
      @grades_hash = Grade.grouped
      @assignments = []
      @grades_hash.each do |key, value|
        @assignments << Assignment.find_by_id(key)

      end
    else
      @grades = current_user.grades.all
    end
  end




  def new
    @grade = Grade.new
  end

  def create
    @student = Student.find(params["grade"][:student_id])
    @assignment = Assignment.find(params["grade"]["assignment_id"])

      # if !@student.student_assignments_total.include?(@assignment)
      #   flash[:error] = "Student and Assignment do not match"
      #   redirect_to new_grade_path
      # else

        @grade = Grade.create(grade_params)
          if @grade.save
                    @grade.assignment_id = params["grade"]["assignment_id"]
                    @grade.student_id = params["grade"][:student_id]
                    flash[:notice] = "Grade was added succesfully."
                    redirect_to grades_path
            else
                    # binding.pry
                    flash[:error] = "There was an error"
                    render 'grades/new'
            end
      # end
    end

    private
      def grade_params
        params.require(:grade).permit(:score, :assignment_id, :student_id)
      end

end
