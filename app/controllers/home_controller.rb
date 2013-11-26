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
      res = Net::HTTP.start('10.41.68.100', 80) do |http|
        http.open_timeout = 4
        http.read_timeout = 4
        post_response = http.request(req)
      end
    rescue Exception => e
      puts 'damn'
      puts e
      render :status => :service_unavailable, :text => "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      return
    end
    
    response = nil
    case res
    when Net::HTTPSuccess
      response = JSON.parse(post_response.body)
    else
      render :status => :service_unavailable, :text => "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      return
    end

    reset_session # prevent session fixation
    
    # If they are a valid teacher/student, then store the data to the session
    if response['student'] != nil
      session['student'] = {
        :name => response['student']['name'],
        :eq_id => response['student']['eq_id'],
        :year => response['student']['cohort']
        }
    elsif response['teacher'] != nil
      session['teacher'] = response['teacher']
    end

    # Now redirect to appropriate area of site
    if is_student
      redirect_to "/student/"
    elsif is_teacher
      redirect_to "/teacher/"
    else
      render :status => :forbidden, :text => "Your username/password did not authenticate successfully."
      return
    end
  end
  
  def logout
  	reset_session
  	redirect_to "/"
  end
end
