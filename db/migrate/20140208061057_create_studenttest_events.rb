class CreateStudenttestEvents < ActiveRecord::Migration
  def change
    create_table :studenttest_events do |t|
      t.string :state
      t.integer :studenttest_id

      t.timestamps
    end
  end
end
