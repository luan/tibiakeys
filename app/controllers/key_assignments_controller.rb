class KeyAssignmentsController < ApplicationController
  before_action :set_key_assignment, only: [:destroy]

  def destroy
    key_set = @key_assignment.key_set
    @key_assignment.destroy
    redirect_to key_set
  end

  private

  def set_key_assignment
    @key_assignment = KeyAssignment.find(params[:id])
  end
end
