require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get mark" do
    get :mark
    assert_response :success
  end

  test "should get unmark" do
    get :unmark
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
