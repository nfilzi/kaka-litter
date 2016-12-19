# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderDetail.destroy_all
Product.destroy_all
Order.destroy_all
UserCompany.destroy_all
Company.destroy_all
User.destroy_all


User.create!(first_name: "Nicolas", last_name: "Filzi", email: "nfilzi.webservices@gmail.com", password: "password", phone_number: "+33678380989")
Company.create!(name: "Filzi Company", billing_address: "4 place Charles Fillion, 75017 Paris", phone_number: "+33678380989", vat_number: "08028402824022")
UserCompany.create!(user: User.first, company: Company.first)

Product.create!(designation: "Litter Bag of 176oz", unit_price: 3.4, features: ["100% mineral", "Odorless", "Absorbent", "Clumping"])
Product.create!(designation: "Box of 6 bags", unit_price: 19.0, features: ["Better storage", "Better display", "Easier to pick from", "Cheaper"])

order = Order.new(company: Company.first, shipping_address: "7 rue de Bel Air, 44000 Nantes", first_order: true)
order.payed_with_card!

order.order_details.build(quantity: 10, product_id: Product.first.id)
order.order_details.build(quantity: 1, product_id: Product.last.id)

order.compute_total_price_ht!
order.save!
puts "One order was saved during seed"
p order
