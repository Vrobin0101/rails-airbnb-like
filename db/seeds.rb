# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

STATUS = %w[pending accepted declined cancelled]

10.times do
  user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'azerty')
  user.save!
end

file = YAML.load_file('db/seed.yml')
file.each do |hash|
  offer_name = hash.keys.first
  image = URI.open(hash[offer_name]['url'])
  offer = Offer.new(product_name: hash.keys.first, category: hash[offer_name]['category'], location: Faker::Address.street_address, price: rand(1..20), user: User.find(rand(1..10)))
  offer.photo.attach(io: image, filename: hash[offer_name], content_type: 'png')
  offer.save!
end

Offer.all.each do |offer|
  Booking.create(start_date: Time.now, end_date: Time.now, user: User.find(rand(1..10)), offer: offer, status: STATUS.sample)
end
