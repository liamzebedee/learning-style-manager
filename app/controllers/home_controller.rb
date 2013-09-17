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
    post_response = Net::HTTP.post_form(LearningStyleManager::AUTH_SERVER_URL, 'uName'=> username, 'pWord'=> password)
    response = JSON.parse(post_response.body)

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
