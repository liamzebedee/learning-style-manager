class LearningTestResult < ActiveRecord::Base
  has_one :dol_test_result
  has_one :gmi_test_result
  has_one :aui_test_result
  has_one :star_test_result
end
