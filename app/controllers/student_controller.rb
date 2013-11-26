class StudentController < ApplicationController
  def do_auth
    if !is_student
      render :status => :forbidden, :text => "You can only see this page if you are a student."
      raise AuthException, "Student not authenticated."
    end
  end

  def index
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'student-home'
    @student_name = session['student'][:name]
    render "student/index"
  rescue AuthException
  end
  
  def overview
  end
end
