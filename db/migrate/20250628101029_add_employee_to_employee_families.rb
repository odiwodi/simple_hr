class AddEmployeeToEmployeeFamilies < ActiveRecord::Migration[7.1]
  def change
    add_reference :employee_families, :employee, null: false, foreign_key: true
  end
end
