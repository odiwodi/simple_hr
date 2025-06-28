class Employee < ApplicationRecord
  belongs_to :gender

  validates :first_name, :last_name, presence: true

  enum marital_status: {
    single: "Single",
    married: "Married",
    divorced: "Divorced",
    widowed: "Widowed"
  }

  def self.ransackable_attributes(auth_object = nil)
    ["birth_date", "created_at", "first_name", "gender_id", "id", "id_value", "is_deleted", "last_name", "middle_name", "updated_at", "marital_status"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["gender"]
  end

  def age
    return nil unless birth_date
    now = Time.zone.now.to_date
    age = now.year - birth_date.year
    age -= 1 if now < birth_date + age.years
    age
  end
end
