class StarTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New STAR learning test | Learning Style Manager"
    @page_id = 'students-star-test'
    @star_test = StarTestResult.new
    render "students/star/new"
  rescue AuthException
  end
  
  def create
    auth_students_only(params)
    student = current_student()
    
  rescue AuthException
  end
end
