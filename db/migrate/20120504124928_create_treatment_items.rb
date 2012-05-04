class CreateTreatmentItems < ActiveRecord::Migration
  def change
    create_table :treatment_items do |t|
      t.integer     :treatment_id, :null => false
      t.integer     :tooth, :null => false
      t.integer     :procedure_id, :null => false
      t.string      :obs
      t.timestamps
    end
  end
end
