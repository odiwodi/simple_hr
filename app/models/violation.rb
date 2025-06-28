class Violation < ApplicationRecord
  enum default_sanction: {
    verbal_warning: "Verbal Warning",
    written_warning: "Written Warning",
    suspension: "Suspension",
    termination: "Termination"
  }

  enum severity_level: {
    minor: "Minor",
    major: "Major",
    grave: "Grave"
  }

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "default_sanction", "description", "id", "id_value", "name", "number_of_offenses_strike", "severity_level", "status", "updated_at"]
  end
end
