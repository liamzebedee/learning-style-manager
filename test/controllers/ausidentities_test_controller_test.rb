require 'test_helper'

class AusidentitiesTestControllerTest < ActionController::TestCase
  test "should show AusIdentities test page" do
    get :new, {:student_id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
end
