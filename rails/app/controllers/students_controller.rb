class StudentsController < ApplicationController
  def dashboard
    auth_students_only(params)
    @page_title = "Dashboard | Learning Style Manager"
    render "students/dashboard"
  rescue AuthException
  end
  
  def show
    auth_students_and_teachers_only(params)
    @page_title = "#{current_student.name}'s results | Learning Style Manager"
    render "students/show"
  rescue AuthException
  end
end
