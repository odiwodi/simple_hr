class CreateJobLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :job_levels do |t|
      t.string :position_name, null: false
      t.string :position_code, null: false
      t.integer :level_rank, null: false, default: 0
      t.text :description

      t.index :position_name, unique: true
      t.index :position_code, unique: true

      t.timestamps
    end
  end
end
