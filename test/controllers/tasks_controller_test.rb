require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get tasks_index_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

  test "should get new" do
    get tasks_new_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get edit" do
    get tasks_edit_url
    assert_response :success
  end

  test "should get update" do
    get tasks_update_url
    assert_response :success
  end

  test "should get complete" do
    get tasks_complete_url
    assert_response :success
  end

  test "should get destroy" do
    get tasks_destroy_url
    assert_response :success
  end

end
