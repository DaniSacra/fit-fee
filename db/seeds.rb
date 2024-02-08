# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(email: "emerson@hey.com") do |user|
  user.name = "Emerson"
  user.password = '123456'
  user.password_confirmation = '123456'
end

User.find_or_create_by!(email: "guilherme@hey.com") do |user|
  user.name = "Guilherme Gianini Artioli"
  user.password = '123456'
  user.password_confirmation = '123456'
end

user = User.find_by(email: "emerson@hey.com")

customers = [
  { name: "Alex Smith", phone: "555-0100", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Jordan Lee", phone: "555-0101", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Taylor Brown", phone: "555-0102", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Morgan Davis", phone: "555-0103", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Casey Garcia", phone: "555-0104", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Jamie Wilson", phone: "555-0105", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Quinn Martinez", phone: "555-0106", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Avery Anderson", phone: "555-0107", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Riley Thomas", phone: "555-0108", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Peyton Moore", phone: "555-0109", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Harper Jackson", phone: "555-0110", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Charlie White", phone: "555-0111", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Bailey Harris", phone: "555-0112", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Dakota Young", phone: "555-0113", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Jordan King", phone: "555-0114", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Taylor Lee", phone: "555-0115", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Morgan Brown", phone: "555-0116", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Casey Davis", phone: "555-0117", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Jamie Garcia", phone: "555-0118", start_date: "2023-01-01", subscription_fee: rand(700..2100) },
  { name: "Quinn Wilson", phone: "555-0119", start_date: "2023-01-01", subscription_fee: rand(700..2100) }
]

customers.each do |customer|
  user.customers.find_or_create_by!(customer)
end
