class Answer < ActiveRecord::Base
  attr_accessible :title, :points, :question_id, :order

  belongs_to :question
  has_many :studentanswers
end
