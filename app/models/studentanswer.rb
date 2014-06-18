class Studentanswer < ActiveRecord::Base
  attr_accessible :points, :question_id, :studenttest_id, :answer_id, :result, :selected, :functionality

  belongs_to :question
  belongs_to :studenttest 
  belongs_to :answer 

  def self.generate_studentanswer(studenttest_id)
    studenttest = Studenttest.find(studenttest_id)
    Question.where(:testtype_id => studenttest.classtest.testtype_id).each do |question|
      self.create(:points => 0, :question_id => question.id, :studenttest_id => studenttest.id, :answer_id => 0, :selected => true)
    end
  end
  def self.generate_studentanswers(studenttest_id)
    studenttest = Studenttest.find(studenttest_id)
    Question.where(:testtype_id => studenttest.classtest.testtype_id).each do |question|
      answers = Answer.where(:question_id => question.id)
      answers.each do |answer|
        self.create(:points => answer.points, :question_id => question.id, :studenttest_id => studenttest.id,:answer_id => answer.id, :selected => false)
      end
    end
  end
end
