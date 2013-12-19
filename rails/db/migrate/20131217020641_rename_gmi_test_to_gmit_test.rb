class RenameGmiTestToGmitTest < ActiveRecord::Migration
  def change
  	rename_table :gmi_test_results, :gmit_test_results
  end
end
