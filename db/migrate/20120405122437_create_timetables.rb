class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer     :dentist_id, :null => false
      t.integer     :day_week, :null => false
      t.time        :start_time, :null => false
      t.time        :stop_time, :null => false
      t.timestamps
    end
    add_foreign_key(:timetables, :dentists)
  end
end
