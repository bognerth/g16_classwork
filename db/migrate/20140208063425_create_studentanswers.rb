class CreateStudentanswers < ActiveRecord::Migration
  def change
    create_table :studentanswers do |t|
      t.integer :question_id
      t.integer :studenttest_id
      t.integer :points, default: 0
      t.string :title

      t.timestamps
    end
  end
end
