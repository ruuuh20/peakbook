class EnrollmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment = Enrollment.new
  end


end
