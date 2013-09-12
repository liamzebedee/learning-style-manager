class TeacherController < ApplicationController
  def index
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'teacher-home'
    render 'teacher/index'
  end

  def student_results
    @page_title = "Student Results | Learning Style Manager"
    @page_id = 'teacher-student-results'

    min_year_level = 10
    max_year_level = 12
    @min_graduating_year = (Time.now.year + 2)
    @max_graduating_year = Time.now.year

    render 'teacher/student_results'
  end
end
