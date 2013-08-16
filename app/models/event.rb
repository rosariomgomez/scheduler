class Event < ActiveRecord::Base
  include IceCube
  attr_accessible :day_end, :day_start, :time_start, :time_end, :name, :occurrences, :recurring_rules
  serialize :occurrences, Hash
  before_save :set_occurrences

  attr_accessor :recurring_rules
  
  def schedule
    schedule = Schedule.new(self.day_start)
    if self.occurrences.blank?
      #no hago nada
    else
      schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.occurrences).until(self.day_end))
    end
    schedule
  end

  protected

  def set_occurrences
    if RecurringSelect.is_valid_rule?(self.recurring_rules)
      write_attribute(:occurrences, RecurringSelect.dirty_hash_to_rule(self.recurring_rules).to_hash)
    else
      write_attribute(:occurrences, nil)
    end
  end

end
