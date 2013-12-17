class Dol5TestController < ApplicationController
	def new
    auth_students_only(params)
    @page_title = "New DOL5 learning test | Learning Style Manager"
    @dol5_test = Dol5TestResult.new
    render "students/dol5/new"
  rescue AuthException
  end
end
