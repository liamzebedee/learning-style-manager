class GmitTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New GMI learning test | Learning Style Manager"
    @gmit_test = GmitTestResult.new
    render "students/gmit/new"
  rescue AuthException
  end
  
  def create
  	auth_students_only(params)
    student = current_student()
    data = params['gmit_test_result']['answers']
    answers = Array.new(GmitTestResult::QUESTIONS.length, 0)
    gmit_test_result = GmitTestResult.new
    
    # Validate answers
    GmitTestResult::QUESTIONS.each_with_index do |question, question_i|
      answer = data[question_i.to_s].to_i
      # Set answer by default to 0
      answers[question_i] = (answer || 0) % GmitTestResult::OPTIONS.length
    end
    gmit_test_result.answers = answers
    
    # Iterate through all the questions
    # Increment gmi_tally for the particular intelligence the question is testing
    tally = {
      GmitTestResult::LINGUISTIC => 0,
      GmitTestResult::MATHEMATICAL => 0,
      GmitTestResult::MUSICAL => 0,
      GmitTestResult::KINESTHETIC => 0,
      GmitTestResult::SPATIAL => 0,
      GmitTestResult::INTERPERSONAL => 0,
      GmitTestResult::INTRAPERSONAL => 0
    }
    answers.each_with_index do |option, question_i|
      intelligence_category = GmitTestResult::QUESTIONS[question_i][1]
      tally[intelligence_category] += option
    end
    gmit_test_result.intelligences_ranked = Hash[tally.sort_by { |intelligence_type, tally| tally }.reverse!]
    
    gmit_test_result.save!
    current_student.gmit_test_results << gmit_test_result
    current_student.save!
    
    redirect_to :controller => 'students', :action => 'dashboard', :id => student.id
  end
end
