class AddStarTallyToStarTestResult < ActiveRecord::Migration
  def change
    add_column :star_test_results, :star_tally, :text
  end
end
