class CreateFinancialAccounts < ActiveRecord::Migration
  def change
    create_table :financial_accounts do |t|
      t.string     :name, :null => false
      t.integer    :type, :null => false
      t.integer    :account_id, :null => false
      t.boolean    :inactive, :null => false, :default => false
      t.timestamps
    end
    add_foreign_key(:financial_accounts, :accounts)
  end
end
