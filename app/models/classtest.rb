class Classtest < ActiveRecord::Base
  attr_accessible :category, :description, :duration, :lecture_id, :title, :testtype_id

  validates :lecture_id, :testtype_id, :title, presence: true

  belongs_to :testtype
  has_many :events, class_name: "ClasstestEvent"
  has_many :studenttests

  after_create :initialize_studenttests

  CATEGORIES = %w(Multiplechoice Text Mixed Upload)

  ICON_STATES = {"new" => 'lock', "open" => "unlock", "canceled" => 'lock', 'shipped' => 'download', 'closed' => 'archive'}
  STATES = %w[new open canceled shipped closed]
  delegate :new?, :open?, :canceled?, :shipped?, :closed?, to: :current_state

  def self.open_tests
    #joins(:events).merge TestEvent.with_last_state("open")
    joins(:events).where("classtest_events.id IN (SELECT MAX(id) FROM classtest_events GROUP BY test_id) AND state = 'open'")
  end

  def current_state
    (events.last.try(:state) || STATES.first).inquiry
  end

  def change(state)
    events.create! state: state
  end

  def search_for_missing_studenttests
    studenttests = Studenttest.where(:classtest_id => self.id)
    studenttest_student_ids = studenttests.map {|s| s.student_id }
    ls_ids = $redis.smembers "students_#{self.lecture_id}"
    lecture_student_ids = ls_ids.map {|id| id.to_i}
    student_without_test = lecture_student_ids - studenttest_student_ids
  end

  def initialize_studenttests
    student_ids = $redis.smembers "students_#{self.lecture_id}"
    student_ids.each do |student_id|
      studenttest = Studenttest.create(:classtest_id => self.id, :student_id => student_id.to_s)
      if self.category == "Upload"
        Studentanswer.generate_studentanswer(studenttest.id)
      else
        Studentanswer.generate_studentanswers(studenttest.id)
      end
    end
  end
end
