class AddReminderToSchedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :reminder, :boolean, :null => false, :default => false
  end
end
