class AusidentitiesTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New AusIdentities learning test | Learning Style Manager"
    @ausidentities_test = AusidentitiesTestResult.new
    render "students/ausidentities/new"
  rescue AuthException
  end
  
  def create
    auth_students_only(params)
    student = current_student()
    data = params['ausidentities_test_result']['answers']
    answers = Array.new(AusidentitiesTestResult::QUESTIONS.length, 0)
    ausidentities_test_result = AusidentitiesTestResult.new
    
    # Validate params
    AusidentitiesTestResult::QUESTIONS.each_with_index do |(question, options), question_i|
      answer = data[question_i.to_s].to_i
      # Set answer by default to 0
      answers[question_i] = (answer || 0) % options.length
    end
    ausidentities_test_result.answers = answers
    
    # Tally the answers according to their various categories
    letter_tally = { :E => 0, :I => 0, :S => 0, :N => 0, :T => 0, :F => 0, :J => 0, :P => 0 }
    answers.each_with_index do |option, question_i|
      option = (option == 0) ? false : true
      category = nil
      # Get category that question is in
      # We have to do question_i mod 4, because the AusIdentities testing data is scrambled so students don't do pattern recognition
      case (question_i % 4)
      when 0
        if option
          letter_tally[:E] += 1
        else
          letter_tally[:I] += 1
        end
      when 1
        if option
          letter_tally[:S] += 1
        else
          letter_tally[:N] += 1
        end
      when 2
        if option
          letter_tally[:T] += 1
        else
          letter_tally[:F] += 1
        end
      when 3
        if option
          letter_tally[:J] += 1
        else
          letter_tally[:P] += 1
        end
      end
    end
    # Create the four letter string to represent the STAR learning style
    letters = ""
    letters += (letter_tally[:E] > letter_tally[:I]) ? "E" : "I"
    letters += (letter_tally[:S] > letter_tally[:N]) ? "S" : "N"
    letters += (letter_tally[:T] > letter_tally[:F]) ? "T" : "F"
    letters += (letter_tally[:J] > letter_tally[:P]) ? "J" : "P"
    ausidentities_test_result.letters = letters
    
    ausidentities_test_result.animal = AusidentitiesTestResult::AUS_IDENTITIES.index("Eagle") if letters.match    /[NT]/
    ausidentities_test_result.animal = AusidentitiesTestResult::AUS_IDENTITIES.index("Kangaroo") if letters.match /[SP]/
    ausidentities_test_result.animal = AusidentitiesTestResult::AUS_IDENTITIES.index("Dolphin") if letters.match  /[NF]/
    ausidentities_test_result.animal = AusidentitiesTestResult::AUS_IDENTITIES.index("Wombat") if letters.match   /[SJ]/
    
    ausidentities_test_result.save!
    current_student.ausidentities_test_results << ausidentities_test_result
    current_student.save!
    
    redirect_to :controller => 'students', :action => 'dashboard', :id => student.id
  end
end
