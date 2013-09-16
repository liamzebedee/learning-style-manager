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
    begin
      options = {:read_timeout => 5, :open_timeout => 5}
      auth_server = Net::HTTP.start(LearningStyleManager::AUTH_SERVER_URL.host, LearningStyleManager::AUTH_SERVER_URL.port, options)
    rescue Net::OpenTimeout
      render :status => :service_unavailable, :text => "We couldn't connect to the authentication server in a timely manner. Try again in a minute when the problem might be fixed."
      return
    end
    request = Net::HTTP::Post.new(LearningStyleManager::AUTH_SERVER_URL.path)
    request.body = { 'username' => username, 'password' => password }
    Rails.logger.debug "Sending authentication request for #{username}"
    response = JSON.parse(auth_server.request(request).read_body)

    reset_session # prevent session fixation

    # If they are a valid teacher/student, then store the data to the session
    if response['student'] != nil
      session['student'] = response['student']
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
