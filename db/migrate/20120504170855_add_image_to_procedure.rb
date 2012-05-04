class AddImageToProcedure < ActiveRecord::Migration
  def change
  	change_table :procedures do |t|
      t.has_attached_file :image
    end
  end
end
