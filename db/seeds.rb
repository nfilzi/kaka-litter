# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "Nicolas", last_name: "Filzi", email: "nfilzi.webservices@gmail.com", password: "password", phone_number: "+33678380989")
Company.create!(name: "Filzi Company", billing_address: "4 place Charles Fillion", phone_number: "+33678380989", vat_number: "08028402824022", user: User.first)
