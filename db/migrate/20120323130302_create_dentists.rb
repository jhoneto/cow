class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.integer     :account_id, :null => false
      t.string      :name, :null => false, :limit => 200
      t.string      :nickname, :null => false, :limit => 30
      t.string      :cpf, :limit => 20
      t.string      :cro_uf, :limit => 2, :null => false
      t.string      :cro_number, :limit => 10, :null => false
      t.string      :home_phone, :limit => 30
      t.string      :cel_phone, :limit => 30, :null => false
      t.string      :work_phone, :limit => 30
      t.text        :obs
      t.timestamps
    end
    add_foreign_key(:dentists, :accounts)
  end
end
