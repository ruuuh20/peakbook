class CoursesController < ApplicationController

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
    else
      flash[:error] = "There was an error"
    redirect_to root_path
  end

  end

  def show
      @course = Course.find(params[:id])
      @assignments = @course.assignments
      @assignment = @course.assignments.build
      @students = Student.all
  end

  private
  def course_params
    params.require(:course).permit(:name, :start_date, :code)
  end
end
