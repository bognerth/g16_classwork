class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.string :description
      t.string :category
      t.integer :testtype_id
      t.integer :lecture_id
      t.integer :duration

      t.timestamps
    end
  end
end
