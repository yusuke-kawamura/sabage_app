99.times do |n|
  name  = Faker::Name.name
  password = "123456"
  User.create!(name:  name,
               password:              password,
               password_confirmation: password)
end