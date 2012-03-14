class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer, :null => false
    add_foreign_key(:users, :accounts)
  end
end
