class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer     :financial_account_id, :null => false
      t.date        :date, :null => false
      t.decimal     :value, :null => false, :precision => 18, :scale => 2
      t.integer     :entry_type, :null => false
      t.boolean     :cancel, :null => false, :default => false
      t.integer     :patient_id
      t.integer     :estimate_id
      t.string      :description, :limit => 255
      t.integer     :payment_id, :null => false
      t.timestamps
    end
    add_foreign_key(:entries, :financial_accounts)
    add_foreign_key(:entries, :payments)
  end
end
