class AddResultFileToStudenttest < ActiveRecord::Migration
  def change
    add_column :studenttests, :result_file, :string
  end
end
