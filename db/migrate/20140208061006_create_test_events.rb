class CreateTestEvents < ActiveRecord::Migration
  def change
    create_table :test_events do |t|
      t.string :state
      t.integer :test_id

      t.timestamps
    end
  end
end
