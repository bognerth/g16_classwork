class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.integer :points, default: 0 

      t.timestamps
    end
  end
end
