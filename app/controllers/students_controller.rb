class StudentsController < ApplicationController
  def dashboard
    auth_students_only
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'students-dashboard'
    render "students/dashboard"
  rescue AuthException
  end
  
  def show
    auth_students_and_teachers_only
    @page_title = "Student Overview | Learning Style Manager"
    @page_id = 'students-show'
    render "students/show"
  rescue AuthException
  end
end
