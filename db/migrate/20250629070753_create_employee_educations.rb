class CreateEmployeeEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_educations do |t|
      t.string :school_name
      t.string :qualification
      t.string :degree_program
      t.string :level
      t.integer :year_passing
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
