class TeachersController < ApplicationController
  def index
    auth_teachers_only
    @page_title = "Dashboard | Learning Style Manager"
    render 'teachers/index'
  rescue AuthException
  end

  def school_results
    auth_teachers_only
    @page_title = "School Results | Learning Style Manager"

    @last_cohort = (Time.now.year + 2)
    @current_cohort = Time.now.year

    render 'teachers/school_results'
  rescue AuthException
  end
end
