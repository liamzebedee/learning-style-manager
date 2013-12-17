class GmitTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New GMI learning test | Learning Style Manager"
    @gmit_test = GmitTestResult.new
    render "students/gmit/new"
  rescue AuthException
  end
end
