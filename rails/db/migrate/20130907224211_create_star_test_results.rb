class CreateStarTestResults < ActiveRecord::Migration
  def change
    create_table :star_test_results do |t|
      t.decimal :spatial
      t.decimal :tactil
      t.decimal :auditory
      t.decimal :reading
      t.text :raw_results

      t.timestamps
    end
  end
end
