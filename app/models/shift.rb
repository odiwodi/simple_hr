class Shift < ApplicationRecord
  validates :name, presence: true, uniqueness: true  
end
