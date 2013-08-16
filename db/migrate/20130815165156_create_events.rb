class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :day_start
      t.date :day_end
      t.string :occurrences

      t.timestamps
    end
  end
end
