require 'test_helper'

class KeySetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_set = key_sets(:one)
  end

  test "should get index" do
    get key_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_key_set_url
    assert_response :success
  end

  test "should create key_set" do
    assert_difference('KeySet.count') do
      post key_sets_url, params: { key_set: { name: @key_set.name, vocation_id: @key_set.vocation_id } }
    end

    assert_redirected_to key_set_url(KeySet.last)
  end

  test "should show key_set" do
    get key_set_url(@key_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_set_url(@key_set)
    assert_response :success
  end

  test "should update key_set" do
    patch key_set_url(@key_set), params: { key_set: { name: @key_set.name, vocation_id: @key_set.vocation_id } }
    assert_redirected_to key_set_url(@key_set)
  end

  test "should destroy key_set" do
    assert_difference('KeySet.count', -1) do
      delete key_set_url(@key_set)
    end

    assert_redirected_to key_sets_url
  end
end
