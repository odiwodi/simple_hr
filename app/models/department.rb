class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "id", "id_value", "location", "name", "payroll_cost_center", "status", "updated_at"]
  end
end
