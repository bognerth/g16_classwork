class AddCreateQuestionsToTesttypes < ActiveRecord::Migration
  def change
    add_column :testtypes, :create_questions, :boolean, :default => false
  end
end
