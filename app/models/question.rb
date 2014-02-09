class Question < ActiveRecord::Base
  attr_accessible :testtype_id, :title, :category, :points, :image, :order
  belongs_to :testtype 
  has_many :answers

  CATEGORIES = %w(Multiplechoice Text)

end
