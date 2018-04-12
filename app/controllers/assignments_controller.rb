class AssignmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @all_assignments = Assignment.all
    # respond_to do |format|
    # format.html {:index}
    @course = Course.find(params[:course_id])
      @assignments = @course.assignments
    render :json =>  @assignments
  # end
  end

  def new

    @assignment = Assignment.new

  end

  def create
    @course = Course.find(params[:course_id])
    # @course = Course.find(params[:id])
    # @assignment = Assignment.create(assignment_params)
    @assignment = @course.assignments.build(assignment_params)
    @assignment.course_id = @course.id
    if current_user.teacher?
      @assignment.user_id = current_user.id
    end
    # binding.pry
    if @assignment.save
      flash[:notice] = "Assignment was created."
      # respond_to do |format|
      #   format.html {redirect_to course_path(@course)}
      #   format.json {render :json =>  @assignment}
      # end
    # render json: @assignment, :status => 201
    redirect_to course_path(@course)
    else
      flash[:error] = "There was an error"
      render 'assignments/new'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    @course = Course.find(params[:course_id])

  end

  def edit
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @assignment = Assignment.update(assignment_params)
      if @assignment.save
        flash[:notice] = "Assignment was updated."
        redirect_to semester_course_assignments_path(@semester, @course, @assignment)
      else
        flash[:error] = "There was an error."
        render 'assignments/edit'
      end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    flash[:notice] = "Deleted"
    redirect_to semester_course_assignments_path(@semester, @course, @assignment)
  end





private
  def assignment_params
    params.require(:assignment).permit(:name, :description, :date, :status, :user_id)
  end


end
