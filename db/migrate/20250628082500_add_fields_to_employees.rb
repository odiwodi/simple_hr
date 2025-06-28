class AddFieldsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :date_of_joining, :date if !column_exists? :employees, :date_of_joining
    add_column :employees, :employment_type, :string if !column_exists? :employees, :employment_type
    add_column :employees, :job_title, :string if !column_exists? :employees, :job_title
    add_reference :employees, :designation, null: true, foreign_key: true if !column_exists? :employees, :designation_id
    add_reference :employees, :department, null: true, foreign_key: true if !column_exists? :employees, :department_id
    add_column :employees, :initial_salary, :decimal, precision: 12, scale: 2
    add_index :employees, :date_of_joining
    add_index :employees, :job_title
  end
end
