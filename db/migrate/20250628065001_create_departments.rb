class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :code
      t.string :payroll_cost_center
      t.string :location
      t.string :status

      t.index :name, unique: true
      t.index :code, unique: true

      t.timestamps
    end
  end
end
