class AddFunctionalityToStudentanswers < ActiveRecord::Migration
  def change
    add_column :studentanswers, :functionality, :integer, default: 0
  end
end
