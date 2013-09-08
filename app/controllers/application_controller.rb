class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "main"
end

def is_student
  true
end

def is_teacher
  false
end

# Returns a Hash containing the student's name, Education Queensland identifier and year level
def get_student_details
  { :name => "Liam Edwards-Playne", :eq_id => "xxxx00", :year => 00 }
end

class AuthException < Exception
end
