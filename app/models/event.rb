class Event < ActiveRecord::Base
  include IceCube
  attr_accessible :day_end, :day_start, :name, :occurrences, :recurring_rules
  serialize :occurrences, Hash
  before_save :set_occurrences

  attr_accessor :recurring_rules
  
  def schedule
    schedule = Schedule.new(self.day_start)
    schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.occurrences).until(self.day_end))
    #schedule.to_s
    schedule.all_occurrences
  end

  protected
 
  def set_occurrences
    write_attribute(:occurrences, RecurringSelect.dirty_hash_to_rule(self.recurring_rules).to_hash)
  end

end
