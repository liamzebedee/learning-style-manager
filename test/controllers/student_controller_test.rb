require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  test "should get test" do
    get :test
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
