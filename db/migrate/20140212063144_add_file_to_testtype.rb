class AddFileToTesttype < ActiveRecord::Migration
  def change
    add_column :testtypes, :test_avatar, :string
  end
end
