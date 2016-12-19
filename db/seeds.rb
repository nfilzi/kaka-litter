# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy previous seeds..."
OrderDetail.destroy_all
Product.destroy_all
Order.destroy_all
UserCompany.destroy_all
ShippingAddress.destroy_all
Company.destroy_all
User.destroy_all



puts "Creating users..."
filzi     = User.create!(first_name: "Nicolas", last_name: "Filzi", email: "nfilzi.webservices@gmail.com", password: "password", phone_number: "+33678380989")
pariente  = User.create!(first_name: "Thomas", last_name: "Pariente", email: "parientethomas@gmail.com", password: "password", phone_number: "+33661011209")

puts "Building companies..."
filzi_co    = Company.new(name: "Filzi Company", phone_number: "+33678380989", vat_number: "08028402824022")
pariente_co = Company.new(name: "Pariente Company", phone_number: "+33661011209", vat_number: "08028402824023")


filzi_co_ship_and_bill_address    = "4 place Charles Fillion, 75017 Paris"
pariente_co_ship_and_bill_address = "14 allée Eric Chaber, 75013 Paris"

puts "Linking companies and users..."
filzi_co.user_companies.build(user: filzi)
pariente_co.user_companies.build(user: pariente)


puts "Adding addresses (billing and shipping) to companies..."
filzi_co.shipping_addresses.build(user: filzi, designation: filzi_co_ship_and_bill_address)
pariente_co.shipping_addresses.build(user: pariente, designation: pariente_co_ship_and_bill_address)

filzi_co.billing_address    = filzi_co_ship_and_bill_address
pariente_co.billing_address = pariente_co_ship_and_bill_address

filzi_co.save
pariente_co.save

puts "Companies created!"

puts "Creating products from Kaka Litter's Catalog..."
litter_bag = Product.create!(designation: "Litter Bag of 176oz", unit_price: 3.4, features: ["100% mineral", "Odorless", "Absorbent", "Clumping"])
box_of_six = Product.create!(designation: "Box of 6 bags", unit_price: 19.0, features: ["Better storage", "Better display", "Easier to pick from", "Cheaper"])

puts "Creating orders for both companies..."
[filzi, pariente].each do |user|
  rand(5..10).times do |step|
    rand_company          = user.companies.sample
    rand_shipping_address = rand_company.shipping_addresses.sample

    puts "Creating order n°#{step + 1} for #{rand_company.name}"

    order                 = Order.new(user: user, company: rand_company, shipping_address: rand_shipping_address)
    order.first_order! if user.no_orders?


    order.order_details.build(quantity: rand(1..4), product: box_of_six)
    order.order_details.build(quantity: rand(1..10), product: litter_bag)

    order.compute_total_price_ht!
    order.save!
  end
end

# order.payed_with_card!

# order.order_details.build(quantity: 10, product_id: Product.first.id)
# order.order_details.build(quantity: 1, product_id: Product.last.id)

# order.compute_total_price_ht!
# order.save!
# puts "One order was saved during seed"
# p order
