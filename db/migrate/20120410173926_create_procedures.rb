class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer     :account_id, :null => false
      t.string      :tuss, :limit => 20
      t.string      :name, :limit => 255, :null => false
      t.boolean     :active, :default => true, :null => false
      t.timestamps
    end
    add_foreign_key(:procedures, :accounts)
  end
end
