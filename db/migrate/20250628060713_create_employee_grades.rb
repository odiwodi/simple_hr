class CreateEmployeeGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_grades do |t|
      t.string :name, null: false
      t.references :job_level, null: false, foreign_key: true

      t.index :name, unique: true
      
      t.timestamps
    end
  end
end
