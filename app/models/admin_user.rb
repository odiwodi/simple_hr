class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
        authentication_keys: [:login]

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  belongs_to :role, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "id_value", "updated_at", "username", "first_name", "middle_name", "last_name", "role_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end

  # Allow login via username or email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
