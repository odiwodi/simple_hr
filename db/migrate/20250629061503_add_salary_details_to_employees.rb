class AddSalaryDetailsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :payroll_cost_center, :string
    add_column :employees, :salary_method, :string
  end
end
