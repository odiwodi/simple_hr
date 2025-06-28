class EmergencyContact < ApplicationRecord
  belongs_to :employee

  RELATIONSHIP_OPTIONS = [
    'Parent',
    'Sibling',
    'Spouse',
    'Friend',
    'Relative',
    'Other'
  ].freeze
end
