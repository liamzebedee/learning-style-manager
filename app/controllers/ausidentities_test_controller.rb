class AusidentitiesTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New AusIdentities learning test | Learning Style Manager"
    @page_id = 'students-ausidentities-test'
    @ausidentities_test = AusidentitiesTestResult.new
    render "students/ausidentities/new"
  rescue AuthException
  end
end
