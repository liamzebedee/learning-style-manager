class StudentsController < ApplicationController
  def dashboard
    auth_students_only(params)
    @page_title = "Dashboard | Learning Style Manager"
    render "students/dashboard"
  rescue AuthException
  end
  
  def show
    auth_students_and_teachers_only(params)
    @page_title = "Student Overview | Learning Style Manager"
    render "students/show"
  rescue AuthException
  end
end
