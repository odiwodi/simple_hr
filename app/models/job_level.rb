class JobLevel < ApplicationRecord
  validates :position_name, presence: true, uniqueness: true
  validates :position_code, presence: true, uniqueness: true
end
