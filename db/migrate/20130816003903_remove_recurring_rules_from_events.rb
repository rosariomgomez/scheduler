class RemoveRecurringRulesFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :recurring_rules
  end

  def down
    add_column :events, :recurring_rules, :string
  end
end
