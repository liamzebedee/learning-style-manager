class StarTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New STAR learning test | Learning Style Manager"
    @page_id = 'students-star-test'
    render "students/star/new"
  rescue AuthException
  end
  
  def create
    auth_students_only(params)
    
  rescue AuthException
  end
end
