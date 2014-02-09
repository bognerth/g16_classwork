class Testtype < ActiveRecord::Base
  attr_accessible :coursetype, :description, :title

  has_many :tests
  has_many :questions
  
  COURSES = %w( Netzwerk Benutzerverwaltung Skripting )
end
