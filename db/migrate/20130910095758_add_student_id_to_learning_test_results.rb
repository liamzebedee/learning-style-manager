class AddStudentIdToLearningTestResults < ActiveRecord::Migration
  def change
    add_column :learning_test_results, :student_id, :integer
  end
end
