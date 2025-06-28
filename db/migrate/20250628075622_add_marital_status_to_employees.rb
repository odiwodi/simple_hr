class AddMaritalStatusToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :marital_status, :string
  end
end
