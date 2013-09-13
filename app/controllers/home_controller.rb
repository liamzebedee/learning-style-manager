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
    # server = connect
    # response = server.POST(params: [username, password])

    reset_session # prevent session fixation

    # If they are a valid teacher/student, then store the data to the session
    # if response['student'] != nil
    #   thing
    # else
    #   thing

    # Now redirect to appropriate area of site
    if is_student
      redirect_to "/student/"
    elsif is_teacher
      redirect_to "/teacher/"
    else
      render :status => :forbidden, :text => "Your username/password did not authenticate successfully."
    end
  end
end
