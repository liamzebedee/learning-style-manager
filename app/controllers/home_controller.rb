class HomeController < ApplicationController
  def index
    if is_student
      redirect_to "/student/", :status => 301
    elsif is_teacher
      #redirect_to "", :status => 301
    else
      @page_title = "Learning Style Manager"
      render "home"
    end
  end
end
