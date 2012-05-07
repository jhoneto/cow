class AddImageToGroup < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
      t.has_attached_file :image
    end

    add_column :procedures, :group_id, :integer, :null => false
    add_foreign_key(:procedures, :groups)
  end
end
