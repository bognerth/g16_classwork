class ChangeTestIdFromStudenttest < ActiveRecord::Migration
  def change
    rename_column :studenttests, :test_id, :classtest_id
  end
end
