class RemoveStarFromStarTestResult < ActiveRecord::Migration
  def change
    remove_column :star_test_results, :spatial, :decimal
    remove_column :star_test_results, :tactile, :decimal
    remove_column :star_test_results, :auditory, :decimal
    remove_column :star_test_results, :reading, :decimal
  end
end
