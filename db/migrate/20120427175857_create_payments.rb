class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer     :account_id, :null => false
      t.string      :name, :null => false
      t.integer     :payment_type, :null => false
      t.boolean     :inactive, :null => false, :default => false
      t.integer     :max_quota
      t.decimal     :tax, :precision => 18, :scale => 2
      t.decimal     :discount_card, :precision => 18, :scale => 2
      t.timestamps
    end
    add_foreign_key(:payments, :accounts)
  end
end
