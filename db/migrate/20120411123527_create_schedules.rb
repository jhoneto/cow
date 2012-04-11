class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer       :account_id, :null => false
      t.integer       :patient_id
      t.integer       :patient_name, :limit => 200, :null => false
      t.integer       :dentist_id, :null => false
      t.date          :date, :null => false
      t.time          :time, :null => false
      t.boolean       :fit, :null => false, :default => false
      t.integer       :status, :null => false, :default => 1 #Agendado
      t.text          :obs
      t.timestamps
    end
    add_foreign_key(:schedules, :accounts)
    add_foreign_key(:schedules, :patients)
    add_foreign_key(:schedules, :dentists)
  end
end
