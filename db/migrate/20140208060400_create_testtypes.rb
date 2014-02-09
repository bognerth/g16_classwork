class CreateTesttypes < ActiveRecord::Migration
  def change
    create_table :testtypes do |t|
      t.string :coursetype
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
