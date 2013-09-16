class TeacherController < ApplicationController
  def do_auth
    if !is_teacher
      render :status => :forbidden, :text => "You can only see this page if you are a teacher."
      raise AuthException, "Teacher not authenticated."
    end
  end

  def index
    do_auth
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'teacher-home'
    render 'teacher/index'
  rescue AuthException
  end

  def student_results
    do_auth
    @page_title = "Student Results | Learning Style Manager"
    @page_id = 'teacher-student-results'

    min_year_level = 10
    max_year_level = 12
    @min_graduating_year = (Time.now.year + 2)
    @max_graduating_year = Time.now.year

    render 'teacher/student_results'
  rescue AuthException
  end
end
