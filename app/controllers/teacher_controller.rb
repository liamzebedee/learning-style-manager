class TeacherController < ApplicationController
  def dashboard
    auth_teachers_only
    @page_title = "Dashboard | Learning Style Manager"
    render 'teachers/dashboard'
  rescue AuthException
  end

  def school_results
    auth_teachers_only
    @page_title = "School Results | Learning Style Manager"
	
    @year10_cohort = (Time.now.year + 2)
    @year12_cohort = Time.now.year

    render 'teachers/school_results'
  rescue AuthException
  end

  def star_ratios_for_cohort
  end
end
