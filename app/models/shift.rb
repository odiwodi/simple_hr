class Shift < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_save :remove_blank_working_days


  DAYS_OF_WEEK = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze
  
  def self.ransackable_attributes(auth_object = nil)
    ["break_end_time", "break_start_time", "created_at", "grace_period", "id", "id_value", "name", "time_in", "time_out", "updated_at", "working_days"]
  end
  
  private

  def remove_blank_working_days
    self.working_days = working_days.reject(&:blank?) if working_days
  end
end
