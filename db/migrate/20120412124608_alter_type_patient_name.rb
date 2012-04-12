class AlterTypePatientName < ActiveRecord::Migration
  def up
  	change_column :schedules, :patient_name, :string, :limit => 200, :null => false
  end

  def down
  end
end
