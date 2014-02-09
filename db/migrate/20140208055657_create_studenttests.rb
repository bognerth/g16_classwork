class CreateStudenttests < ActiveRecord::Migration
  def change
    create_table :studenttests do |t|
      t.integer :test_id
      t.integer :student_id
      t.datetime :start
      t.datetime :end
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
