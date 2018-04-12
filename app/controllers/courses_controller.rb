class CoursesController < ApplicationController

  before_action :authenticate_user!

  def index
    @courses = Course.all

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      flash[:notice] = "Course created"
      redirect_to courses_path
    else
      flash[:error] = "There was an error"
    redirect_to root_path
  end

  end

  def show
      @course = Course.find(params[:id])
      @assignments = @course.assignments
      @assignment = @course.assignments.build
      @students = @course.students.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
  @course = Course.find(params[:id])
  if @course.update(course_params)
    @course.save
    flash[:notice] = "Course Updated"
    redirect_to course_path(@course.id)
  else
    flash[:error] = "There was an error"
    redirect_to courses_path
  end
end

def destroy
  @course = Course.find(params[:id])
  @course.destroy
  flash[:notice] = "Successfully deleted"
  redirect_to courses_path
end

  private
  def course_params
    params.require(:course).permit(:name, :start_date, :code)
  end
end
