class AssignmentsController < ApplicationController
   before_action :set_assignment, only: [:show, :edit, :update, :destroy]

   def index
    @people = Person.all
    @projects = Project.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
   @assignment = Assignment.new(assignment_params)

   respond_to do |format|
     if @assignment.save
       format.html { redirect_to @assignment.project, notice: 'Assignment was successfully created.' }
       format.json { render :show, status: :created, location: @assignment }
     else
       format.html { render :new }
       format.json { render json: @assignment.errors, status: :unprocessable_entity }
     end
   end
 end

 def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to @assignment.project, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find_by(find_by_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def assignment_params
    params.require(:assignment).permit(:worker_id, :project_id)
  end

  def find_by_params
    params.permit(:worker_id, :project_id)
  end

end
