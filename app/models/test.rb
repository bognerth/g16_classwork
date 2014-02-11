class Test < ActiveRecord::Base
  attr_accessible :category, :description, :duration, :lecture_id, :title, :testtype_id

  validates :lecture_id, :testtype_id, :title, presence: true

  belongs_to :lecture
  belongs_to :testtype

  after_create :initialize_studenttests

  CATEGORIES = %w(Multiplechoice Text Mixed)

  has_many :events, class_name: "TestEvent"

  STATES = %w[new open canceled shipped closed]
  delegate :new?, :open?, :canceled?, :shipped?, :closed?, to: :current_state

  def self.open_tests
    #joins(:events).merge TestEvent.with_last_state("open")
    joins(:events).where("test_events.id IN (SELECT MAX(id) FROM test_events GROUP BY test_id) AND state = 'open'")
  end

  def current_state
    (events.last.try(:state) || STATES.first).inquiry
  end

  def change(state)
    events.create! state: state
  end

  def initialize_studenttests
    student_ids = $redis.smembers "students_#{self.lecture_id}"
    #raise student_ids.to_yaml
    student_ids.each do |student_id|
      studenttest = Studenttest.create(:test_id => self.id, :student_id => student_id) 
      Question.where(:testtype_id => self.testtype_id).each do |question|
        Studentanswer.create(:points => 0, :question_id => question.id, :studenttest_id => studenttest.id)
      end
    end
  end
end
