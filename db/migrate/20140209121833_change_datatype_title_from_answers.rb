class ChangeDatatypeTitleFromAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :title, :text
  end
end
