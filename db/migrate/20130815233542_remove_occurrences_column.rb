class RemoveOccurrencesColumn < ActiveRecord::Migration
  def up
    remove_column :events, :occurrences
  end

  def down
  end
end
