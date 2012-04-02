class CreateDentistSpecialties < ActiveRecord::Migration
  def change
    create_table :dentist_specialties do |t|
      t.integer    :dentist_id, :null => false
      t.integer    :specialty_id, :null => false
      t.timestamps
    end
    add_foreign_key(:dentist_specialties, :dentists)
    add_foreign_key(:dentist_specialties, :specialties)
  end
end
