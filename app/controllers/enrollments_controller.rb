class EnrollmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
        flash[:notice] = "Enrollment was created succesfully."
        redirect_to enrollments_path
      else
        flash[:error] = "There was an error"
        render 'enrollments/new'
    end
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end


end
