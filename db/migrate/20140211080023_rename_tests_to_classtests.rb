class RenameTestsToClasstests < ActiveRecord::Migration
  def change
      rename_table :tests, :classtests
  end 
end
