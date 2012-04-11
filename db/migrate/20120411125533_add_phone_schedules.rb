class AddPhoneSchedules < ActiveRecord::Migration
  def up
  	add_column :schedules, :phone, :string, :limit => 20
  end

  def down
  end
end
