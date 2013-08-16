class AddOccurrencesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :occurrences, :string
  end
end
