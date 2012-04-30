class CreateEstimatePayments < ActiveRecord::Migration
  def change
    create_table :estimate_payments do |t|
      t.integer     :estimate_id, :null => false
      t.integer     :payment_type, :null=> false
      t.decimal     :value, :null => false, :precision => 18, :scale => 2
      t.integer     :quotes
      t.timestamps
    end
    add_foreign_key(:estimate_payments, :estimates)
  end
end
