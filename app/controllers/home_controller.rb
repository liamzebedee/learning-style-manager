class HomeController < ApplicationController
  def index
    @page_title = "Learning Style Manager"
    @page_id = 'home'
    render "home/index"
  end

  def login
    # Connect to authentication server and validate credentials
    # XXX

    # If they are a valid teacher/student, then store the data to the session
    reset_session # prevent session fixation
    # XXX

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
