class CreateEmployeeWorkExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_work_experiences do |t|
      t.string :company_name, null: false
      t.string :position, null: false
      t.decimal :salary, precision: 12, scale: 2
      t.string :address
      t.integer :years_of_service
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
