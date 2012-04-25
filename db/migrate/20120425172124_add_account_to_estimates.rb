class AddAccountToEstimates < ActiveRecord::Migration
  def change
  	add_column :estimates, :account_id, :integer, :null => false
  	add_foreign_key(:estimates, :accounts)
  end
end
