require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  test "should show student dashboard" do
    # TODO should centralise this test student 'Billy Jo' to a single fixture for both development and testing
    get :dashboard, {:id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
  
  test "should show student results page" do
  	get :show, {:id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
  	assert_response :success
  end
end
