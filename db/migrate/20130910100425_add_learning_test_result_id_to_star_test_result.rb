class AddLearningTestResultIdToStarTestResult < ActiveRecord::Migration
  def change
    add_column :star_test_results, :learning_test_result_id, :integer
  end
end
