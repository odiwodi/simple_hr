class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "id_value", "updated_at", "username", "first_name", "middle_name", "last_name", "role_id"]
  end
end
