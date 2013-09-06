class StudentController < ApplicationController
  def index
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'student-home'
    render "student/index"
  end

  def test
    @page_title = "Test yourself | Learning Style Manager"
    @page_id = 'student-test'

    # student
    # - dol[:habits_ranked][:needs_work] = [3,6,8,15]
    # - star[:s] = 0.78 (decimal)
    # - gmi[:intelligences_ranked] = [Linguistic, Mathematical, Musical, Bodily/Kinesthetic, Spatial, Interpersonal, Intrapersonal]
    # - aus_identities[:animal] = :kangaroo
    # - aus_identities[:letters] = [:s, :t, :a, :r]

    render "student/test"
  end

  def results
    @page_title = "Results | Learning Style Manager"
    @page_id = 'student-results'
    render "student/results"
  end

  def results_update
  end
end
