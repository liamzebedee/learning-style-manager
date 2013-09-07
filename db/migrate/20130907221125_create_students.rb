class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :name
      t.integer :year
      t.text :eq_id

      t.timestamps
    end
  end
end
