# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#User Seed
Review.destroy_all
Booking.destroy_all
Item.destroy_all
User.destroy_all

our_user = User.create!(first_name: "Lee", last_name: "Wagon", email: "leewagon@gmail.com", password: "1234567" , address: "Diputacio 409" , is_seller:true)
10.times do
  User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password, address: Faker::Address.street_name, is_seller:false)
end

sellers = []

5.times do
  sellers << User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password, address: Faker::Address.street_name, is_seller:true)
end

#Item seed
items = []
category = ["trousers", "t-shirt", "shoes", "jackets", "dress", "suits"]
size = ["XS", "S", "M", "L", "XL"]
condition = ["horrible", "super", "amazing", "mid", "bad", "don't know"]


sellers.each do |seller|
  rand(1..5).times do
    items << Item.create!(user_id: seller.id, category: category.sample, size: size.sample, condition: condition.sample, price_per_day: rand(0..100), description: Faker::GreekPhilosophers.quote, title: Faker::JapaneseMedia::Doraemon.gadget)
  end
end

#Booking seed
bookings = []

bookings << Booking.create!(start_date: "24/12/2024", end_date: "31/12/2024", total_price: rand(10..100), user_id: our_user.id, item_id: items.sample.id)
15.times do
  bookings << Booking.create!(start_date: "24/12/2024", end_date: "31/12/2024", total_price: rand(10..100), user_id: User.all.sample.id, item_id: items.sample.id)
end

#Review seed
bookings.each do |booking|
  rand(1..3).times do
    Review.create!(comment: Faker::Quote.yoda, rating: rand(1..5), booking_id: Booking.all.sample.id)
  end
end
