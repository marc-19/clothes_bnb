# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

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
items_data = [
  { title: "Casual soft Trousers", category: "Trousers", description: "A stylish and versatile trouser perfect for casual outings.", image: "https://content.asos-media.com/-/media/homepages/mw/2024/september/23-us/mw_asosdesign.jpg" },
  { title: "Nordstrom Designer vest", category: "Shirt", description: "Elegant and comfortable vest for any occasion.", image: "https://n.nordstrommedia.com/it/889a4d55-8c27-4327-a252-ae877d748e84.jpeg?h=365&w=240&dpr=2" },
  { title: "Primitive Logo Tee", category: "Shirt", description: "Soft cotton tee with a minimalist logo design.", image: "https://image-cdn.hypb.st/https%3A%2F%2Fs3.store.hypebeast.com%2Fmedia%2Fimage%2F2013%2F10%2FPrimitive_Tee_Blk_2_2.jpg?fit=max&w=460&q=60" },
  { title: "Tuesday Label Dress", category: "Dress", description: "A light and breezy dress for summer evenings.", image: "https://www.tuesdaylabel.com/cdn/shop/files/TuesdayLabel-SS24-LB-468_1024x1024.jpg?v=1730345552" },
  { title: "Nude Project Hoodie", category: "Jacket", description: "Cozy and warm hoodie for lounging or going out.", image: "https://nude-project.com/cdn/shop/files/TIMEHOODASH_back.jpg?v=1716972928" },
  { title: "Levis Slim Fit Jeans", category: "Trousers", description: "Classic denim jeans with a modern slim fit.", image: "https://lsco.scene7.com/is/image/lsco/362000124-detail1-pdp-lse?fmt=jpeg&qlt=70&resMode=sharp2&fit=crop,1&op_usm=0.6,0.6,8&wid=2000&hei=1840" },
  { title: "Vintage New Balance Shoes", category: "Shoes", description: "Timeless shoes with a vintage vibe. You will love it", image: "https://i.ebayimg.com/images/g/qIgAAOSwtRVmuaBR/s-l1200.jpg" },
  { title: "Stone Island Puffer Jacket", category: "Jacket", description: "High-performance puffer coat for extreme weather.", image: "https://www.zoeteliefmode.nl/wp-content/uploads/2024/07/stone-island-43128-seamless-puffer-coat-bp_15mf_7hk_she55j.jpg" },
  { title: "Patagonia Fleece Shirt", category: "Shirt", description: "Comfortable and eco-friendly fleece shirt.", image: "https://www.patagonia.com.hk/cdn/shop/files/WBF24_38518_TPGN.jpg" },
  { title: "Patagonia Rain Jacket", category: "Jacket", description: "Waterproof and breathable jacket for outdoor adventures.", image: "https://www.switchbacktravel.com/sites/default/files/images/articles/Patagonia%20Boulder%20Fork%20rain%20jacket%20%28backpacking%20in%20Chile%29.jpg" }
]
category = ["trousers", "t-shirt", "shoes", "jackets", "dress", "suits"]
size = ["XS", "S", "M", "L", "XL"]
condition = ["horrible", "super", "amazing", "mid", "bad", "don't know"]


count = 0
sellers.each do |seller|

  2.times do
    file = URI.parse(items_data[count][:image]).open
    item = Item.create!(user_id: seller.id, size: size.sample, condition: condition.sample, price_per_day: rand(5..40),
    category: items_data[count][:category], title: items_data[count][:title], description: items_data[count][:description])
    item.image.attach(io: file, filename: "#{item.title.parameterize}.png", content_type: "image/png")
    items << item
    count += 1
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
