class CreateAuiTestResults < ActiveRecord::Migration
  def change
    create_table :aui_test_results do |t|
      t.text :raw_results
      t.string :letters
      t.integer :animal

      t.timestamps
    end
  end
end
