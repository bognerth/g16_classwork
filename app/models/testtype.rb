# encoding: utf-8

class Testtype < ActiveRecord::Base
  attr_accessible :coursetype, :description, :title, :test_avatar, :create_questions

  has_many :classtests
  has_many :questions, :dependent => :destroy
  
  mount_uploader :test_avatar, TestAvatarUploader

  COURSES = %w( Linux LinuxShell LinuxServer Programmierung LostAndFound )

  def sum_points
    questions.sum(:points)
  end

  after_save :initialize_questions
  def initialize_questions
    if create_questions
      update_attribute(:create_questions, false)
      Question.destroy_all(:testtype_id => id)
      File.open(Rails.root.join("public/#{self.test_avatar.url}"), 'r').each do |line|
        #begin
          question = Question.last 
          unless line[0] == '#'
            zeile = line.split(';')
            if zeile[0] == '@'
              question = Question.create(testtype_id: id, title: zeile[2], category: zeile[1])
              logger.info "Frage"
            else
              if question
                Answer.create(title: zeile[1], question_id: question.id, points: zeile[0])
              else
                logger.info line
              end
            end
          
        #rescue  Exception => e
         # logger.info "FEHLER beim FragenErstellen: " << e.to_s << line
        end
      end
      #raise

    end
  end
end
