class RenameAuiTestToAusidentitiesTest < ActiveRecord::Migration
  def change
    rename_table :aui_test_results, :ausidentities_test_results
  end
end
