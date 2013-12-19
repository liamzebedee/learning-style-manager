class CreateGmiTestResults < ActiveRecord::Migration
  def change
    create_table :gmi_test_results do |t|
      t.text :intelligences_ranked
      t.text :raw_results

      t.timestamps
    end
  end
end
