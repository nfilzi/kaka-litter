# puts "Destroy previous seeds..."
# OrderDetail.destroy_all
# Product.destroy_all
# Order.destroy_all
# ShippingAddress.destroy_all

puts "Creating products from Kaka Litter's Catalog..."
litter_bag = Product.create!(sku: "litter-bag", designation: "Box of 176 oz", unit_price: 3.4, features: ["Soft & light", "Stays dry on the surface", "Box with pouring spout"])
box_of_six = Product.create!(sku: "box-of-six-litter-bags", designation: "Display-box of 6 boxes", unit_price: 19.0)
