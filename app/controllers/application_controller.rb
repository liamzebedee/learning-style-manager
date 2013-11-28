class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "main"
  
  helper_method :current_student

  def current_student
    @current_student ||= Student.find_by(session['student'][:id])
  end
end

def is_student
  session['student'] != nil
end

def is_teacher
  session['teacher'] != nil
end

def auth_students_only(params)
  if session['student'][:id] != params[:id].to_i
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
  if current_student.id != params[:id] and !is_teacher
    render :status => :forbidden, :text => "You can only see this page if you are a student or teacher."
    raise AuthException, "Student/teacher not authenticated."
  end
end

class AuthException < Exception
end
