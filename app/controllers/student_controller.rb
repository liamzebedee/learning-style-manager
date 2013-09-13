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
    student = Student.find_or_create_by(eq_id: 'ledwa7')
    test = LearningTestResult.new


    # Dimensions of Learning
    # ----------------------
    dol = test.dol_test_result = DolTestResult.new
    dol.raw_results = params['dol']
    # Classify habits
    dol_habits_ranked = {
      :lacks_awareness => [],
      :understand_meaning => [],
      :developing_strategies => [],
      :becoming_a_habit => []
    }
    dol.raw_results.each do |(habit, rank)|
      case rank.to_i
      when 0
        dol_habits_ranked[:lacks_awareness] << habit
      when 1
        dol_habits_ranked[:understand_meaning] << habit
      when 2
        dol_habits_ranked[:developing_strategies] << habit
      when 3
        dol_habits_ranked[:becoming_a_habit] << habit
      end
    end
    dol.habits_ranked = dol_habits_ranked
    dol.save!


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
    aui.save!


    # Gardner's Multiple Intelligences
    # --------------------------------
    gmi = test.gmi_test_result = GmiTestResult.new
    gmi.raw_results = params['gmi']
    # Iterate through all the questions
    # Increment gmi_tally for the particular intelligence the question is testing
    gmi_tally = {
      GmiTestResult::LINGUISTIC => 0,
      GmiTestResult::MATHEMATICAL => 0,
      GmiTestResult::MUSICAL => 0,
      GmiTestResult::KINESTHETIC => 0,
      GmiTestResult::SPATIAL => 0,
      GmiTestResult::INTERPERSONAL => 0,
      GmiTestResult::INTRAPERSONAL => 0
    }
    gmi.raw_results.each do |question_num, option|
      intelligence_category = GmiTestResult::QUESTIONS.values[question_num.to_i]
      gmi_tally[intelligence_category] += option.to_i
    end
    # Sort gmi_tally_sort by the tally into a hash in descending order
    gmi.intelligences_ranked = Hash[gmi_tally.sort_by { |intelligence_type, tally| tally }.reverse!]
    gmi.save!


    # Spatial Tactile Auditory Reading
    # --------------------------------
    star = test.star_test_result = StarTestResult.new
    star.raw_results = params['star']
    # Tally the responses for each letter
    star_tally = { :S => 0, :T => 0, :A => 0, :R => 0 }
    star.raw_results.each do |question_num, option|
      case option.to_i
      when 0
        star_tally[:S] += 1
      when 1
        star_tally[:T] += 1
      when 2
        star_tally[:A] += 1
      when 3
        star_tally[:R] += 1
      end
    end
    # Calculate the percentages
    star_ranked = { :spatial => 0, :tactile => 0, :auditory => 0, :reading => 0 }
    star_tally.each do |letter, total|
      # Get a floating point between 0 and 1 to two decimal places
      percentage = (total.to_f / StarTestResult::QUESTIONS.length).round(2)
      case letter
      when :S
        star_ranked[:spatial] = percentage
      when :T
        star_ranked[:tactile] = percentage
      when :A
        star_ranked[:auditory] = percentage
      when :R
        star_ranked[:reading] = percentage
      end
    end
    star.star_ranked = star_ranked
    star.save!


    test.save
    student.learning_test_result = test
    student.save

    redirect_to '/student/results'
  rescue AuthException
  end

  def results
    do_auth
    @page_title = "Results | Learning Style Manager"
    @page_id = 'student-results'
    student = Student.find_by(eq_id: 'ledwa7')
    if student.learning_test_result == nil
      render "student/results-error"
    else
      @test = student.learning_test_result

      @dol = @test.dol_test_result

      @gmi = @test.gmi_test_result

      @star = @test.star_test_result
      @star_ordered = Hash[@star.star_ranked.sort_by { |letter, percentage| percentage }.reverse!]
      @star_first = @star_ordered.keys[0].to_s

      @aui = @test.aui_test_result
      @aui_animal = AuiTestResult::AUS_IDENTITIES[@aui.animal]

      render "student/results"
    end
  rescue AuthException
  end
end
