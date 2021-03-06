require 'net/protocol'
require 'net/http'
require 'json'
require 'uri'

class HomeController < ApplicationController
  def index
    @page_title = "Learning Style Manager"
    @page_id = 'home'
    render "home/index"
  end

  def login
    username = params['username']
    password = params['password']

    # Connect to authentication server and validate credentials
    uri = URI.parse(URI.escape LearningStyleManager::AUTH_SERVER_URI)
    req = Net::HTTP::Post.new(LearningStyleManager::AUTH_SERVER_URI)
    req.set_form_data('uName'=> username, 'pWord'=> password)
    post_response = nil
    begin
      res = Net::HTTP.start(uri.host, uri.port, {:open_timeout=>2, :read_timeout=>3}) do |http|
        post_response = http.request(req)
      end
    rescue Exception => e
      flash[:notice] = "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      redirect_to :back
      return
    end
    
    response = nil
    case res
    when Net::HTTPSuccess
      response = JSON.parse(post_response.body)
    else
      flash[:notice] = "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      redirect_to :back
      return
    end

    reset_session # prevent session fixation
    
    # If they are a valid teacher/student, then store the data to the session and redirect
    if response['student'] != nil
      student = Student.find_or_create_by(eq_id: response['student']['eq_id'], year: response['student']['cohort'], name: response['student']['name'])
      session['student'] = {
        :id => student.id
      }
      redirect_to :controller => 'students', :action => 'dashboard', :id => student.id
    elsif response['teacher'] != nil
      session['teacher'] = response['teacher']
      redirect_to "/teachers/dashboard"
    else
      flash[:notice] = "Your username/password was wrong"
      redirect_to :back
    end
  end
  
  def logout
  	reset_session
  	redirect_to "/"
  end
end
