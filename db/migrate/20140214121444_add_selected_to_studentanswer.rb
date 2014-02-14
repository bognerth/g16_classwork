class AddSelectedToStudentanswer < ActiveRecord::Migration
  def change
    add_column :studentanswers, :selected, :boolean, :default => false
    remove_column :studentanswers, :title
  end
end
