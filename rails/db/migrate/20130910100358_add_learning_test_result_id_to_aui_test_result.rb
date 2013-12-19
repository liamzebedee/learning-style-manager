class AddLearningTestResultIdToAuiTestResult < ActiveRecord::Migration
  def change
    add_column :aui_test_results, :learning_test_result_id, :integer
  end
end
