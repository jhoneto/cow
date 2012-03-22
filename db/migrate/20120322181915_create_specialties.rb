class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.integer     :account_id, :null => false
      t.string      :name, :null => false, :limit => 100
      t.timestamps
    end
    add_foreign_key(:specialties, :accounts)
  end
end
