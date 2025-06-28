class CreateEmployeeFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_families do |t|
      t.string :full_name
      t.string :relationship
      t.date :birth_date
      t.references :gender, null: true, foreign_key: true
      t.string :contact_number

      t.timestamps
    end
  end
end
