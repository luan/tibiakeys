require 'test_helper'

class KeyAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_assignment = key_assignments(:one)
  end

  test "should get index" do
    get key_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_key_assignment_url
    assert_response :success
  end

  test "should create key_assignment" do
    assert_difference('KeyAssignment.count') do
      post key_assignments_url, params: { key_assignment: { action_object: @key_assignment.action_object, action_type: @key_assignment.action_type, key_sequence: @key_assignment.key_sequence, key_set_id: @key_assignment.key_set_id } }
    end

    assert_redirected_to key_assignment_url(KeyAssignment.last)
  end

  test "should show key_assignment" do
    get key_assignment_url(@key_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_assignment_url(@key_assignment)
    assert_response :success
  end

  test "should update key_assignment" do
    patch key_assignment_url(@key_assignment), params: { key_assignment: { action_object: @key_assignment.action_object, action_type: @key_assignment.action_type, key_sequence: @key_assignment.key_sequence, key_set_id: @key_assignment.key_set_id } }
    assert_redirected_to key_assignment_url(@key_assignment)
  end

  test "should destroy key_assignment" do
    assert_difference('KeyAssignment.count', -1) do
      delete key_assignment_url(@key_assignment)
    end

    assert_redirected_to key_assignments_url
  end
end
