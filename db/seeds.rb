# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
def create_admin_user(email, password)
  admin_user = AdminUser.create!(email: email, password: password, password_confirmation: password)
  print "new admin user creds:\n#{admin_user.email}\n#{password}\n" if admin_user.persisted?
end

if Rails.env.development?
  create_admin_user('admin@example.com', 'password')
else
  pwd = SecureRandom.hex(20)
  create_admin_user('admin@technavyphil.com', pwd)
end