class CreateEstimateProcedures < ActiveRecord::Migration
  def change
    create_table :estimate_procedures do |t|
      t.integer     :estimate_id, :null => false
      t.integer     :procedure_id, :null => false
      t.decimal     :value, :precision => 18, :scale => 2
      t.integer     :amount, :precision => 18, :scale => 2
      t.timestamps
    end

    add_foreign_key(:estimate_procedures, :estimates)
    add_foreign_key(:estimate_procedures, :procedures)
  end
end
