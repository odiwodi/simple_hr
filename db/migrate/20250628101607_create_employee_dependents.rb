class CreateEmployeeDependents < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_dependents do |t|
      t.string :full_name, null: false
      t.string :relationship, null: false
      t.date :birth_date
      t.references :gender, null: false, foreign_key: true
      t.string :dependent_type
      t.string :contact_number
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
