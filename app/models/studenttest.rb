class Studenttest < ActiveRecord::Base
  attr_accessible :end, :points, :start, :student_id, :test_id

  has_many :events, class_name: "StudenttestEvent"

  STATES = %w[new started closed shipped ]
  delegate :new?, :started?, :closed?, :shipped?, to: :current_state

  def self.open_tests
    #joins(:events).merge TestEvent.with_last_state("open")
    joins(:events).where("studenttest_events.id IN (SELECT MAX(id) FROM studenttest_events GROUP BY studenttest_id) AND state = 'open'")
  end

  def current_state
    (events.last.try(:state) || STATES.first).inquiry
  end

  def change(state)
    events.create! state: state
  end

end
