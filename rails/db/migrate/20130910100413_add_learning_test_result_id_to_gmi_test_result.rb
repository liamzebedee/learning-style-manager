class AddLearningTestResultIdToGmiTestResult < ActiveRecord::Migration
  def change
    add_column :gmi_test_results, :learning_test_result_id, :integer
  end
end
