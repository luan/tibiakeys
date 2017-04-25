class KeyAssignmentsController < ApplicationController
  before_action :set_key_assignment, only: [:show, :edit, :update, :destroy]

  # GET /key_assignments
  # GET /key_assignments.json
  def index
    @key_assignments = KeyAssignment.all
  end

  # GET /key_assignments/1
  # GET /key_assignments/1.json
  def show
  end

  # GET /key_assignments/new
  def new
    @key_assignment = KeyAssignment.new
  end

  # GET /key_assignments/1/edit
  def edit
  end

  # POST /key_assignments
  # POST /key_assignments.json
  def create
    @key_assignment = KeyAssignment.new(key_assignment_params)

    respond_to do |format|
      if @key_assignment.save
        format.html { redirect_to @key_assignment, notice: 'Key assignment was successfully created.' }
        format.json { render :show, status: :created, location: @key_assignment }
      else
        format.html { render :new }
        format.json { render json: @key_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_assignments/1
  # PATCH/PUT /key_assignments/1.json
  def update
    respond_to do |format|
      if @key_assignment.update(key_assignment_params)
        format.html { redirect_to @key_assignment, notice: 'Key assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_assignment }
      else
        format.html { render :edit }
        format.json { render json: @key_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_assignments/1
  # DELETE /key_assignments/1.json
  def destroy
    @key_assignment.destroy
    respond_to do |format|
      format.html { redirect_to key_assignments_url, notice: 'Key assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_assignment
      @key_assignment = KeyAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_assignment_params
      params.require(:key_assignment).permit(:key_sequence, :action_type, :action_object, :key_set_id)
    end
end
