class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays do |t|
      t.string :name
      t.date :date
      t.string :holiday_type
      t.text :description
      t.boolean :is_recurring, null: false, default: false

      t.index :name
      t.index :holiday_type
      t.index :is_recurring

      t.timestamps
    end
  end
end
