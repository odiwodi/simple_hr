class CreateDesignations < ActiveRecord::Migration[7.1]
  def change
    create_table :designations do |t|
      t.string :name, null: false
      t.references :department, null: true, foreign_key: true
      t.references :job_level, null: true, foreign_key: true
      t.string :payroll_cost_center

      t.index [:department_id, :name], unique: true

      t.timestamps
    end
  end
end
