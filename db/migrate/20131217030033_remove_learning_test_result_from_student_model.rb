class RemoveLearningTestResultFromStudentModel < ActiveRecord::Migration
  def change
    remove_column :learning_test_results, :student_id
  end
end
