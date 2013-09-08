class StudentController < ApplicationController
  def do_auth
    if !is_student
      render :status => :forbidden, :text => "Forbidden fruit"
      raise AuthException, "Student not auth'ed"
    end
  end

  def index
    do_auth
    @page_title = "Dashboard | Learning Style Manager"
    @page_id = 'student-home'
    render "student/index"
  rescue AuthException
  end

  def test
    do_auth
    @page_title = "Test yourself | Learning Style Manager"
    @page_id = 'student-test'

    # student
    # - dol[:habits_ranked][:needs_work] = [3,6,8,15]
    # - gmi[:intelligences_ranked] = [Linguistic, Mathematical, Musical, Bodily/Kinesthetic, Spatial, Interpersonal, Intrapersonal]
    # - star[:s] = 0.78 (decimal)
    # - aus_identities[:animal] = :kangaroo
    # - aus_identities[:letters] = ""

    render "student/test"
  rescue AuthException
  end

  def results_update
    do_auth
    student = Student.find_or_create_by(eq_id: get_student_details[:eq_id])

    render 'student/results'
    #redirect_to '/student/results'
  rescue AuthException
  end

  def results
    @page_title = "Results | Learning Style Manager"
    @page_id = 'student-results'
    render "student/results"
  rescue AuthException
  end
end
