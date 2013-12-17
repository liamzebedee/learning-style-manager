class RenameRawResulesToAnswersInTestModels < ActiveRecord::Migration
  def change
  	rename_column :gmit_test_results, :raw_results, :answers
rename_column :ausidentities_test_results, :raw_results, :answers
  	rename_column :dol5_test_results, :raw_results, :answers
  	rename_column :star_test_results, :raw_results, :answers
  end
end
