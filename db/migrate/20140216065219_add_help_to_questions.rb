class AddHelpToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :help, :string
  end
end
