require 'test_helper'

class GmitTestControllerTest < ActionController::TestCase
  test "should show GMIT test page" do
    get :new, {:student_id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
end
