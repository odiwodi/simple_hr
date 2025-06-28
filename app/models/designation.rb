class Designation < ApplicationRecord
  belongs_to :department
  belongs_to :job_level

  validates :name, presence: true, uniqueness: { scope: :department_id }
end
