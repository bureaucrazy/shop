# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brand = ["Hershey", "Whisper", "Webber", "Trojan", "Dairyland", "Sony", "Benalyn", "Softsoap", "Lipton"]
adjective = ["white", "dark", "special", "bonus", "large", "mild", "hot", "expired", "sensitive", "rich"]
product = ["Egg", "Milk", "Candy", "Antihistamine", "Sugar", "Coffee", "Tea", "Cheese", "Yogurt", "Lube"]
20.times do
  title       = "#{brand.sample} #{adjective.sample} #{product.sample}"
  description = title
  price       = rand(1000).to_f / 100
  Product.create({title:        title,
                   description: description,
                   price:       price})
end
