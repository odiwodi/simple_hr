class Shift < ApplicationRecord
  has_many :employees, foreign_key: :assigned_shift_id, class_name: 'Employee'

  validates :name, presence: true, uniqueness: true

  before_save :remove_blank_working_days


  DAYS_OF_WEEK = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze
  
  def self.ransackable_attributes(auth_object = nil)
    ["break_end_time", "break_start_time", "created_at", "grace_period", "id", "id_value", "name", "time_in", "time_out", "updated_at", "working_days"]
  end

  def shift_duration
    return nil if time_in.blank? || time_out.blank?
    end_time = time_out
    end_time += 1.day if end_time < time_in
    duration = (end_time - time_in) / 60 # duration in minutes
    break_minutes = break_duration || 0
    duration - break_minutes
  end

  def break_duration
    return nil if break_start_time.blank? || break_end_time.blank?
    (break_end_time - break_start_time) / 60 # duration in minutes
  end

  def rest_days
    DAYS_OF_WEEK - (working_days || [])
  end

  private

  def remove_blank_working_days
    self.working_days = working_days.reject(&:blank?) if working_days
  end
end
