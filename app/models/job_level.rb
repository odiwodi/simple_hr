class JobLevel < ApplicationRecord
  has_many :employee_grades
  validates :position_name, presence: true, uniqueness: true
  validates :position_code, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "level_rank", "position_code", "position_name", "updated_at"]
  end

  def name
    position_name
  end
end
