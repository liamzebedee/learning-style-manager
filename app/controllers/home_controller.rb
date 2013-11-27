require 'net/protocol'
require 'net/http'
require 'json'

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
    req = Net::HTTP::Post.new(LearningStyleManager::AUTH_SERVER_URI)
    req.set_form_data('uName'=> username, 'pWord'=> password)
    post_response = nil
    begin
      res = Net::HTTP.start('10.41.68.100', 80, {:open_timeout=>2, :read_timeout=>3}) do |http|
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
      session['student'] = {
        :eq_id => response['student']['eq_id']
      }
      Student.find_or_create_by(eq_id: response['student']['eq_id'], year: response['student']['year'], name: response['student']['name'])
      redirect_to student_path(current_student())
    elsif response['teacher'] != nil
      session['teacher'] = response['teacher']
      redirect_to "/teachers/"
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
