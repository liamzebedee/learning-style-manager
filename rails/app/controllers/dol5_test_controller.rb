class Dol5TestController < ApplicationController
	def new
    auth_students_only(params)
    @page_title = "New DOL5 learning test | Learning Style Manager"
    @dol5_test = Dol5TestResult.new
    render "students/dol5/new"
  rescue AuthException
  end
  
  def create
    auth_students_only(params)
    student = current_student()
    data = params['dol5_test_result']['answers']
    answers = Array.new(Dol5TestResult::QUESTIONS.length, 0)
    dol5_test_result = Dol5TestResult.new
    
    # Validate answers
    Dol5TestResult::QUESTIONS.each_with_index do |question, question_i|
      answer = data[question_i.to_s].to_i
      # Set answer by default to 0
      answers[question_i] = (answer || 0) % Dol5TestResult::OPTIONS.length
    end
    dol5_test_result.answers = answers
    
    # Classify habits
    dol_habits_ranked = {
      :lacks_awareness => [],
      :understand_meaning => [],
      :developing_strategies => [],
      :becoming_a_habit => []
    }
    answers.each_with_index do |rank, habit|
      case rank
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
    dol5_test_result.habits_ranked = dol_habits_ranked
    dol5_test_result.save!
    
    current_student.dol5_test_results << dol5_test_result
    current_student.save!
    
    redirect_to :controller => 'students', :action => 'dashboard', :id => student.id
  end
end
