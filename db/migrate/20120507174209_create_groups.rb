class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string      :name, :null => false
      t.integer     :account_id, :null => false
      t.timestamps
    end
    add_foreign_key(:groups, :accounts)
  end
end
