class AddSkillSetToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :skill_set, :string
  end
end
