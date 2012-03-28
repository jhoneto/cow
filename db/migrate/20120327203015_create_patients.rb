class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer    :account_id, :null => false
      t.string     :name, :limit => 200, :null => false
      t.string     :rg, :limit => 30
      t.string     :rg_orgao, :limit => 50
      t.string     :cpf, :limit => 20
      t.date       :date_of_birth
      t.string     :sex, :limit => 1
      t.string     :nationality, :limit => 200
      t.string     :place_of_birth, :limit => 200
      t.string     :marital_status, :limit => 1
      t.string     :occupation, :limit => 200
      t.string     :home_phone, :limit => 30
      t.string     :cel_phone, :limit => 30, :null => false
      t.string     :work_phone, :limit => 30
      t.timestamps
    end
    add_foreign_key(:patients, :accounts)  
  end
end
