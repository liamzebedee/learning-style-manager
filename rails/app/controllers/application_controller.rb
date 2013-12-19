class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "main"
  
  helper_method :current_student, :is_student, :is_teacher, 
    :auth_students_only, :auth_teachers_only, :auth_students_and_teachers_only
  
  # TODO replace authentication with framework like Devise gem
  
  def current_student
  	if is_student
      @current_student ||= Student.find_by(id: session['student'][:id])
    elsif is_teacher
      student_id ||= params[:id]
      student_id ||= params[:student_id]
      @current_student ||= Student.find_by(id: student_id)
    end
  end
  
  def is_student
  session['student'] != nil
  end

  def is_teacher
    session['teacher'] != nil
  end

  def auth_students_only(params)
    student_id ||= params[:id]
    student_id ||= params[:student_id]
    
    if session['student'].nil? or session['student'][:id] != student_id.to_i
      render :status => :forbidden, :text => "You are not authorised to see this page."
      raise AuthException, "Student not authenticated."
    end
  end

  def auth_teachers_only
    if !is_teacher
      render :status => :forbidden, :text => "You can only see this page if you are a teacher."
      raise AuthException, "Teacher not authenticated."
    end
  end

  def auth_students_and_teachers_only(params)
    student_id ||= params[:id]
    student_id ||= params[:student_id]
    
    if (session['student'].nil? or session['student'][:id] != student_id.to_i) and !is_teacher
      render :status => :forbidden, :text => "You can only see this page if you are a student or teacher."
      raise AuthException, "Student/teacher not authenticated."
    end
  end
end

class AuthException < Exception
end
