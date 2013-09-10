class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "main"
end

def is_student
  # Check session for student object
  true
end

def is_teacher
  # Check session for teacher object
  false
end

# Returns a Hash containing the student's name, Education Queensland identifier
def get_student_details
  # get session data
  { :name => "Liam Edwards-Playne", :eq_id => "xxxx00", :year => 11 }
end

class AuthException < Exception
end
