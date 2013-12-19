require 'test_helper'

class Dol5TestControllerTest < ActionController::TestCase
  test "should show DOL5 test page" do
    get :new, {:student_id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
end
