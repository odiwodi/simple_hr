class CreateEmergencyContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :emergency_contacts do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :relationship
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
