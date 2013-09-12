class Student < ActiveRecord::Base
  # name  :string
  # year  :integer
  # eq_id :text
  has_one :learning_test_result

  def year_level
    last_school_year_level = 12
    student_year_level = last_school_year_level - (Time.now.year - @year)
  end
end

