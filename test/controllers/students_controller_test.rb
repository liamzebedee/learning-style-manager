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
    get :dashboard, {:id => students(:dave).id}, {'student'=>{:eq_id=>'dave123'}}
    assert_response :success
  end
end
