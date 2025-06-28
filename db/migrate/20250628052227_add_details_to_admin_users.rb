class AddDetailsToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :username, :string
    add_index :admin_users, :username, unique: true
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :middle_name, :string
    add_column :admin_users, :last_name, :string
    add_reference :admin_users, :role, null: true, foreign_key: true
  end
end
