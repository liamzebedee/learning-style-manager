class StarTestController < ApplicationController
  def new
    auth_students_only(params)
    @page_title = "New STAR learning test | Learning Style Manager"
    @star_test = StarTestResult.new
    render "students/star/new"
  rescue AuthException
  end
  
  def create
    auth_students_only(params)
    student = current_student()
    data = params['star_test_result']['answers']
    answers = []
    star_test_result = StarTestResult.new
    
    # Validate params
    StarTestResult::QUESTIONS.each_with_index do |(question, options), question_i|
      answer = data[question_i.to_s].to_i
      # Set answer by default to 0
      answers[question_i] = (answer || 0) % options.length
    end
    star_test_result.answers = answers
    
    # Tally the responses for each letter
    star_tally = { :S => 0, :T => 0, :A => 0, :R => 0 }
    answers.each do |question_i, option|
      case option
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
    star_test_result.star_tally = star_tally
    
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
    
    star_test_result.star_ranked = star_ranked
    star_test_result.save!
    
    current_student.star_test_results << star_test_result
    current_student.save!
    
    redirect_to :controller => 'students', :action => 'dashboard', :id => student.id
  rescue AuthException
  end
  
end
