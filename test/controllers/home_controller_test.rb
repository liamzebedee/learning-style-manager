require 'test_helper'
require 'json'
require 'rack'

class HomeControllerTest < ActionController::TestCase
  attr_accessor :sample_logins

  def setup
    @@sample_logins = {
      :student_login => {
        :username => "bjo123",
        :password => "BTC"
      },

      :teacher_login => {
        :username => "blair",
        :password => "WhoLetHimOut"
      },

      :bad_login => {
        :username => "swagmaster",
        :password => "yolo"
      }
    }
	stub_request(:post, LearningStyleManager::AUTH_SERVER_URI).
    to_return(:body => lambda { |request|
      data = Rack::Utils.parse_nested_query request.body
      if data['uName'] == @@sample_logins[:student_login][:username] and data['pWord'] == @@sample_logins[:student_login][:password]
        # Student Login
        # FIXME this will create a record in the database with this information. This kinda is against the whole spirit of the Rails testing model, but it's kinda unavoidable.
        return '{"student": {"cohort":2014,"name":"Bobby Jo","eq_id":"bjo123"}}'
        
      elsif data['uName'] == @@sample_logins[:teacher_login][:username] and data['pWord'] == @@sample_logins[:teacher_login][:password]
        # Teacher Login
        return '{"teacher":{}}'
        
      else
      	# Bad login
      	return '{"error":1}'
      end
    })
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should successfully login a student" do
  	post :login, username: @@sample_logins[:student_login][:username], password: @@sample_logins[:student_login][:password]
  	assert_not_nil session['student']
  	assert_redirected_to dashboard_student_path(@controller.current_student)
  end
  
  test "should successfully login a teacher" do
  	post :login, username: @@sample_logins[:teacher_login][:username], password: @@sample_logins[:teacher_login][:password]
  	assert_not_nil session['teacher']
  	assert_redirected_to "/teachers/"
  end
  
  test "should fail to login given bad credentials" do
    request.env["HTTP_REFERER"] = '/'
  	post :login, username: @@sample_logins[:bad_login][:username], password: @@sample_logins[:bad_login][:password]
  	# FIXME this may be bad for future versions
  	assert_nil(session['teacher'])
  	assert_nil(session['student'])
  end
end
