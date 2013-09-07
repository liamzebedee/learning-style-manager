class Student < ActiveRecord::Base
  has_one :learning_test_result
end
