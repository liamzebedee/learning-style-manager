class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "main"
end

def is_student
  # Check session for student object
  session['student'] != nil
end

def is_teacher
  # Check session for teacher object
  session['teacher'] != nil
end

class AuthException < Exception
end
