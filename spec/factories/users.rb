# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    # mobile_number { Faker::PhoneNumber.cell_phone} 
    mobile_number { "9876543210" }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
