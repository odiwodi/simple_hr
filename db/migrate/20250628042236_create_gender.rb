class CreateGender < ActiveRecord::Migration[7.1]
  def change
    create_table :genders do |t|
      t.string :name

      t.timestamps

      t.index :name, unique: true
    end
  end
end
