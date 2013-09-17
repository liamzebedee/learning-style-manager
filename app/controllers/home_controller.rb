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

    # Connect to authentication server and validate credentials (5 second timeout)
    auth_server = nil

    res = Net::HTTP.post_form(LearningStyleManager::AUTH_SERVER_URL, 'uName'=> username, 'pWord'=> password)
=begin
    begin
      options = {:read_timeout => 5, :open_timeout => 5}
      auth_server = Net::HTTP.start(LearningStyleManager::AUTH_SERVER_URL.host, LearningStyleManager::AUTH_SERVER_URL.port, options)
    rescue Net::OpenTimeout
      render :status => :service_unavailable, :text => "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      return
    end
    #request = Net::HTTP::Post.new(LearningStyleManager::AUTH_SERVER_URL.path)
    params = { }
    Rails.logger.debug "Sending authentication request for #{username} to #{LearningStyleManager::AUTH_SERVER_URL.path}"
    xxx1 = auth_server.post(LearningStyleManager::AUTH_SERVER_URL.path, "uName=#{username}&pWord={password}")
    puts xxx1.read_body
=end
    response = JSON.parse(res.body)
    puts response

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
end
