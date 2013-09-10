class TeacherController < ApplicationController
  def index
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'teacher-home'
    render 'teacher/index'
  end

  def student_results
    @page_title = "Student Results | Learning Style Manager"
    @page_id = 'teacher-student-results'
    render 'teacher/student_results'
  end
end
