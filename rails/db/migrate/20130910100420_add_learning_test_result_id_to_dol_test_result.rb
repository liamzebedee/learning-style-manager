class AddLearningTestResultIdToDolTestResult < ActiveRecord::Migration
  def change
    add_column :dol_test_results, :learning_test_result_id, :integer
  end
end
