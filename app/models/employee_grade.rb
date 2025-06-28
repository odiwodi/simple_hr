class EmployeeGrade < ApplicationRecord
  belongs_to :job_level
  validates :name, presence: true, uniqueness: true
end
