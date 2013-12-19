class CreateLearningTestResults < ActiveRecord::Migration
  def change
    create_table :learning_test_results do |t|

      t.timestamps
    end
  end
end
