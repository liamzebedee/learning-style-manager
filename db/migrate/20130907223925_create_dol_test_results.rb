class CreateDolTestResults < ActiveRecord::Migration
  def change
    create_table :dol_test_results do |t|
      t.text :habits_ranked
      t.text :raw_results

      t.timestamps
    end
  end
end
