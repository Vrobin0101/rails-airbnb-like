# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'azerty')
  user.save!
  rand(1..3).times do
    offer = Offer.new(product_name: Faker::Hobby.activity, category: Faker::App.name, location: Faker::Address.street_address, price: rand(1..20), user: user)
    offer.save!
  end
end

Offer.all.each do |offer|
  Booking.create(start_date: Time.now, end_date: Time.now, user: User.find(rand(1..10)), offer: offer)
end
