class ChangeFinancialAccountType < ActiveRecord::Migration
  def up
  	remove_column :financial_accounts, :type
  	add_column :financial_accounts, :account_type, :integer, :null => false
  end

  def down
  	remove_column :financial_accounts, :account_type
  	add_column :financial_accounts, :type, :integer, :null => false
  end
end
