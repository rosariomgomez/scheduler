class AddRecurringRulesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurring_rules, :string
  end
end
