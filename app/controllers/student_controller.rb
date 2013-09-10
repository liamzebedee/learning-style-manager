class StudentController < ApplicationController
  def do_auth
    if !is_student
      render :status => :forbidden, :text => "Forbidden fruit"
      raise AuthException, "Student not authenticated."
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
    # Get student (create if necessary)
    #student_details = get_student_details
    #student = Student.find_or_create_by_eq_id(student_details[:eq_id])
    #student.name = student_details[:name]

    # Setup the test results
    student = Student.find_or_create_by_eq_id('ledwa7')
    test = student.learning_test_result = LearningTestResult.new

    # Dimensions of Learning
    # ----------------------
    dol = test.dol_test_result = DolTestResult.new
    dol.raw_results = params['dol']
    # Classify habits
    dol.raw_results.each do |(habit, rank)|
      case rank.to_i
      when 0
        dol.habits_ranked[:lacks_awareness] << habit
      when 1
        dol.habits_ranked[:understand_meaning] << habit
      when 2
        dol.habits_ranked[:developing_strategies] << habit
      when 3
        dol.habits_ranked[:becoming_a_habit] << habit
      end
    end

    # AusIdentities
    # -------------
    aui = test.aui_test_result = AuiTestResult.new
    aui.raw_results = params['aui']
    # Tally the answers according to their various categories
    aui_letter_tally = { :E => 0, :I => 0, :S => 0, :N => 0, :T => 0, :F => 0, :J => 0, :P => 0 }
    aui.raw_results.each do |(question_num, option)|
      option = (option.to_i == 0) ? false : true
      category = nil
      # Get category that question is in
      case (question_num.to_i % 4)
      when 0
        if option
          aui_letter_tally[:E] += 1
        else
          aui_letter_tally[:I] += 1
        end
      when 1
        if option
          aui_letter_tally[:S] += 1
        else
          aui_letter_tally[:N] += 1
        end
      when 2
        if option
          aui_letter_tally[:T] += 1
        else
          aui_letter_tally[:F] += 1
        end
      when 3
        if option
          aui_letter_tally[:J] += 1
        else
          aui_letter_tally[:P] += 1
        end
      end
    end
    # Create the four letter string to represent the STAR learning style
    aui.letters = ""
    aui.letters += (aui_letter_tally[:E] > aui_letter_tally[:I]) ? "E" : "I"
    aui.letters += (aui_letter_tally[:S] > aui_letter_tally[:N]) ? "S" : "N"
    aui.letters += (aui_letter_tally[:T] > aui_letter_tally[:F]) ? "T" : "F"
    aui.letters += (aui_letter_tally[:J] > aui_letter_tally[:P]) ? "J" : "P"
    # Select their animal
    aui.animal = AuiTestResult::AUS_IDENTITIES.index("Eagle") if aui.letters.match    /[NT]/
    aui.animal = AuiTestResult::AUS_IDENTITIES.index("Kangaroo") if aui.letters.match /[SP]/
    aui.animal = AuiTestResult::AUS_IDENTITIES.index("Dolphin") if aui.letters.match  /[NF]/
    aui.animal = AuiTestResult::AUS_IDENTITIES.index("Wombat") if aui.letters.match   /[SJ]/


    gmi = test.gmi_test_result = GmiTestResult.new
    gmi.raw_results = params['aui']

    star = test.star_test_result = StarTestResult.new
    star.raw_results = params['star']


    @p = aui.inspect
    render 'student/results'
    #redirect_to 'student/results'
  rescue AuthException
  end

  def results
    do_auth
    @page_title = "Results | Learning Style Manager"
    @page_id = 'student-results'
    render "student/results"
  rescue AuthException
  end
end
