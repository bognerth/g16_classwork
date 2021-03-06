class StudenttestEvent < ActiveRecord::Base
  attr_accessible :state, :studenttest_id
  belongs_to :studenttest

  validates_presence_of :studenttest_id
  validates_inclusion_of :state, in: Studenttest::STATES

  #!! Method nicht verwenden, funktioniert nur unter sqlite
  def self.with_last_state(state)

    #order("id desc").group("test_id").having(state: state) #original, gibt aber bei mysql einen Fehler 

    #order("id desc").group("test_id").where(state: state) #ergaenzt den select um eine Tabelle, funktioniert aber nicht korrekt. Siehe unten
    #SELECT `tests`.* FROM `tests` INNER JOIN `test_events` ON `test_events`.`test_id` = `tests`.`id` GROUP BY test_events.test_id HAVING `test_events`.`state` = 'open' ORDER BY tests.id desc;
    #Aenderung:
    #SELECT `tests`.*, test_events.* FROM `tests` INNER JOIN `test_events` ON `test_events`.`test_id` = `tests`.`id` GROUP BY test_events.test_id HAVING `test_events`.`state` = 'open' ORDER BY tests.id desc;
    
    order("id desc").group("studenttest_id").having(state: state)
  end
end
