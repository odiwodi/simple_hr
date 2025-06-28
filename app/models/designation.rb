class Designation < ApplicationRecord
  belongs_to :department
  belongs_to :job_level

  validates :name, presence: true, uniqueness: { scope: :department_id }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "department_id", "id", "id_value", "job_level_id", "name", "payroll_cost_center", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["department", "job_level"]
  end
end
