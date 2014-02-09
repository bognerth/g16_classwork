class Studentanswer < ActiveRecord::Base
  attr_accessible :points, :question_id, :studenttest_id, :title
end
