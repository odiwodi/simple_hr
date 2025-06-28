class AddContactDetailsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :mobile_number, :string
    add_column :employees, :email_address, :string
    add_column :employees, :company_email_address, :string
    add_column :employees, :current_address, :string
    add_column :employees, :permament_address, :string
  end
end
