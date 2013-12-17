class RenameDolTestToDol5Test < ActiveRecord::Migration
  def change
  	rename_table :dol_test_results, :dol5_test_results
  end
end
