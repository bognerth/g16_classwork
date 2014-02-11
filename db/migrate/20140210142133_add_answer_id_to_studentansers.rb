class AddAnswerIdToStudentansers < ActiveRecord::Migration
  def change
    add_column :studentanswers, :answer_id, :integer
    add_column :studentanswers, :result, :text
  end
end
