class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.string :name, null: false
      t.time :time_in
      t.time :time_out
      t.time :break_start_time
      t.time :break_end_time
      t.integer :grace_period
      t.json :working_days

      t.index :name, unique: true

      t.timestamps
    end
  end
end
