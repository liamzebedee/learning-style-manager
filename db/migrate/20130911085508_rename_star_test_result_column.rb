class RenameStarTestResultColumn < ActiveRecord::Migration
  def change
    rename_column :star_test_results, :tactil, :tactile
  end
end
