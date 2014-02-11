class ChangeColumnTestevent < ActiveRecord::Migration
  def change
    rename_table :test_events, :classtest_events
    rename_column :classtest_events, :test_id, :classtest_id
  end
end
