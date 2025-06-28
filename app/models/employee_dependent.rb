class EmployeeDependent < ApplicationRecord
  belongs_to :gender
  belongs_to :employee

  validates :full_name, :relationship, presence: true
end
