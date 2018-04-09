class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.create(student_params)
    if @student.save
        flash[:notice] = "Student created"
        redirect_to students_path
      else
        flash[:error] = "There was an error"
      redirect_to root_path
    end

  end


  private
   def student_params
     params.require(:student).permit(:last_name, :first_name)
   end

end
