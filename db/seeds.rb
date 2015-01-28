require 'faker'
5.times do
  User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.domain_suffix)
end