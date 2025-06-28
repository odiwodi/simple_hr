class Employee < ApplicationRecord
  belongs_to :gender
  belongs_to :department
  belongs_to :designation
  has_many :emergency_contacts
  belongs_to :leave_approver, class_name: "Employee", optional: true
  belongs_to :assigned_shift, class_name: "Shift", optional: true
  has_many :employee_families

  validates :first_name, :last_name, presence: true
  
  accepts_nested_attributes_for :emergency_contacts, allow_destroy: true
  accepts_nested_attributes_for :employee_families, allow_destroy: true

  enum marital_status: {
    single: "Single",
    married: "Married",
    divorced: "Divorced",
    widowed: "Widowed"
  }

  def self.ransackable_attributes(auth_object = nil)
    ["birth_date", "created_at", "first_name", "gender_id", "id", "id_value", "is_deleted", "last_name",
    "middle_name", "updated_at", "marital_status", "department_id", "job_title", "date_of_joining"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["gender", "department"]
  end

  def last_first_name
    "#{last_name}, #{first_name}"
  end

  def age
    return nil unless birth_date
    now = Time.zone.now.to_date
    age = now.year - birth_date.year
    age -= 1 if now < birth_date + age.years
    age
  end
end
