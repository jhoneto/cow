class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.date        :date, :null => false
      t.integer     :patient_id, :null => false
      t.decimal     :total, :precision => 18, :scale => 2
      t.decimal     :discount, :precision => 18, :scale => 2
      t.decimal     :final_value, :precision => 18, :scale => 2
      t.decimal     :balance, :precision => 18, :scale => 2 
      t.boolean     :canceled, :null => false, :default => false
      t.timestamps
    end
  end
end
