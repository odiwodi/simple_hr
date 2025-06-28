class Shift < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  DAYS_OF_WEEK = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze
  
end
