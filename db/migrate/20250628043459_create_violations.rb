class CreateViolations < ActiveRecord::Migration[7.1]
  def change
    create_table :violations do |t|
      t.string :name
      t.text :description
      t.string :severity_level
      t.string :default_sanction
      t.integer :number_of_offenses_strike
      t.string :status

      t.index :name, unique: true
      t.index :status

      t.timestamps
    end
  end
end
