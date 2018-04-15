class StudentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.create(student_params)


    if @student.save && @student.course_ids.count === 1  #make a new enrollment per course but not per student
        Enrollment.create(:student_id => params[:id], :course_id => @student.course_ids.first)
      elsif @student.save && @student.course_ids.count > 1
        @student.course_ids.each do |course_id|
          Enrollment.create(:student_id => params[:id], :course_id => @student.course_id)
        end
        flash[:notice] = "Student created"
        redirect_to students_path
      else
        flash[:error] = "There was an error"
      redirect_to root_path
    end

  end

  def show
    @student = Student.find(params[:id])
  end


  private
   def student_params
     params.require(:student).permit(:last_name, :first_name, course_ids:[], courses_attributes: [:name])
   end

end
