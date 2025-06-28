class EmployeeDependent < ApplicationRecord
  belongs_to :gender
  belongs_to :employee

  validates :full_name, :relationship, presence: true

  RELATIONSHIP_OPTIONS = [
    'Parent',
    'Sibling',
    'Spouse',
    'Child',
    'Other'
  ].freeze

  DEPENDENT_TYPE_OPTIONS = [
    'Parent',
    'Sibling',
    'Spouse',
    'Child',
    'Other',
  ].freeze

  def age
    return nil unless birth_date
    now = Time.zone.now.to_date
    age = now.year - birth_date.year
    age -= 1 if now < birth_date + age.years
    age
  end
end
