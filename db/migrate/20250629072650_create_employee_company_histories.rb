class CreateEmployeeCompanyHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_company_histories do |t|
      t.string :branch
      t.references :department, null: false, foreign_key: true
      t.string :position
      t.references :designation, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
