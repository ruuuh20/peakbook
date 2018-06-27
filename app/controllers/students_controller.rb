class StudentsController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin, :only => :create

  def index
    @students = Student.all
    @student = Student.new
    respond_to do |format|
    format.html {render :index}
    format.json {render json: @students}
  end
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.create(student_params)


    if @student.save && @student.course_ids.count === 1  #make a new enrollment per course but not per student
        Enrollment.create(:student_id => params[:id], :course_id => @student.course_ids.first)
        redirect_to courses_path
      elsif @student.save && @student.course_ids.count > 1
        @student.course_ids.each do |course_id|
          Enrollment.create(:student_id => params[:id], :course_id => @student.course_id)
        end
        flash[:notice] = "Student created"
        redirect_to students_path
        respond_to do |format|
          format.html {redirect_to students_path}
          format.json {render :json =>  @student}
        end
      else
        flash[:error] = "There was an error"
      redirect_to root_path
    end

  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

#   def update
#   @course = Course.find(params[:id])
#   if @course.update(course_params)
#     @course.save
#     flash[:notice] = "Course Updated"
#     redirect_to course_path(@course.id)
#   else
#     flash[:error] = "There was an error"
#     redirect_to courses_path
#   end
# end

def destroy
  @student = Student.find(params[:id])
  @student.destroy
  flash[:notice] = "Successfully deleted"
  redirect_to students_path
end


  private
   def student_params
     params.require(:student).permit(:last_name, :first_name, course_ids:[], courses_attributes: [:name])
   end

end
