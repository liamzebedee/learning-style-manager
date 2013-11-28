require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  attr_accessor :default_student
  def setup
    @@default_student = {'student' => {
      :year => 2014,
      :eq_id => 'ledwa7',
      :name => 'Liam Edwards-Playne' 
    }}
  end
  
  test "should show student dashboard" do
    # TODO should centralise this test student 'Billy Jo' to a single fixture for both development and testing
    get :dashboard, {:id => students(:billy).id}, {'student'=>{:id=>students(:billy).id}}
    assert_response :success
  end
end
