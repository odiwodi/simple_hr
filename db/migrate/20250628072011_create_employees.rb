class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.references :gender, null: false, foreign_key: true
      t.date :birth_date
      t.boolean :is_deleted, null: false, default: true

      t.index :first_name
      t.index :middle_name
      t.index :last_name
      t.index :is_deleted
      t.timestamps
    end
  end
end
