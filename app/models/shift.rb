class Shift < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  DAYS_OF_WEEK = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze
  
  def self.ransackable_attributes(auth_object = nil)
    ["break_end_time", "break_start_time", "created_at", "grace_period", "id", "id_value", "name", "time_in", "time_out", "updated_at", "working_days"]
  end
end
