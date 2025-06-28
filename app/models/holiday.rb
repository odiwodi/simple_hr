class Holiday < ApplicationRecord
  enum holiday_type: {
    regular_holiday: "Regular Holiday",
    special_non_working_holiday: "Special Non-Working Holiday",
    special_working_holiday: "Special Working Holiday"
  }

  validates :name, presence: true
  validates :date, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "description", "holiday_type", "id", "id_value", "is_recurring", "name", "updated_at"]
  end
end
