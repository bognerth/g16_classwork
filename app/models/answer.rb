class Answer < ActiveRecord::Base
  attr_accessible :title, :points, :question_id

  belongs_to :question
end
