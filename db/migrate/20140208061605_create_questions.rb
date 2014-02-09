class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.string :category
      t.integer :testtype_id
      t.integer :points, default: 5
      t.string :image

      t.timestamps
    end
  end
end
