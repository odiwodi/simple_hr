class AddDetailsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :family_background, :text
    add_column :employees, :health_details, :text
    add_column :employees, :insurance, :string
  end
end
