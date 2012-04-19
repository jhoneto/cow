class AddPriceToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :price, :decimal, :precision => 18, :scale => 2
  end
end
