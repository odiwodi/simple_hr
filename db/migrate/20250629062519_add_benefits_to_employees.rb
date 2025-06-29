class AddBenefitsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :benefits, :json
  end
end
