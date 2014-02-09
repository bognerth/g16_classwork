class Test < ActiveRecord::Base
  attr_accessible :category, :description, :duration, :lecture_id, :title, :testtype_id

  CATEGORIES = %w(Multiplechoice Text Mixed)
end
