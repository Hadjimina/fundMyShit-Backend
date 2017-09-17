# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  User.create(email: Faker::Internet.email, username: Faker::Name.first_name, password: 123)
end


20.times do
  Challenge.create(title: Faker::RickAndMorty.character, description: Faker::RickAndMorty.quote, price: rand(100..500), challenger_id: rand(10))
end


60.times do
  Payment.create(amount: rand(20..50), challenge_id: rand(20), payer_id: rand(10))
end
