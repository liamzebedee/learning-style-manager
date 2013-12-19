class AddStarHashToStarTestResult < ActiveRecord::Migration
  def change
    add_column :star_test_results, :star_ranked, :text
  end
end
