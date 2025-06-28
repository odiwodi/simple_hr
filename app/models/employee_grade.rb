class EmployeeGrade < ApplicationRecord
  belongs_to :job_level
  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "job_level_id", "name", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["job_level"]
  end

end
