class AddVariousLearningTestsToStudentModel < ActiveRecord::Migration
  def change
    add_column :dol5_test_results, :student_id, :integer
    add_column :gmit_test_results, :student_id, :integer
  	add_column :star_test_results, :student_id, :integer
  	add_column :ausidentities_test_results, :student_id, :integer
  end
end
