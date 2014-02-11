class Testtype < ActiveRecord::Base
  attr_accessible :coursetype, :description, :title

  has_many :classtests
  has_many :questions
  
  COURSES = %w( Netzwerk Benutzerverwaltung Skripting LostAndFound )

  def sum_points
    questions.sum(:points)
  end
end
