class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer    :user_id, :null => false
      t.integer    :role, :null => false
      t.timestamps
    end
    add_foreign_key(:user_roles, :users)
  end
end
