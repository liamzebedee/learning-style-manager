require 'test_helper'

class StarTestControllerTest < ActionController::TestCase
  test "should show STAR test page" do
    get :new, {:student_id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
  
  test "should submit test result successfully" do
  	#post :create, 
  end
end
