class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer     :account_id, :null => false
      t.integer     :dentist_id, :null => false
      t.integer     :patient_id, :null => false
      t.date        :date, :null => false
      t.integer     :schedule_id
      t.integer     :estimate_id
      t.timestamps
    end
    add_foreign_key(:treatments, :accounts)
    add_foreign_key(:treatments, :dentists)
    add_foreign_key(:treatments, :patients)
    add_foreign_key(:treatments, :schedules)
    add_foreign_key(:treatments, :estimates)
  end
end
