# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: "Jay", last_name: "Naidu", username: "jnaidu", phone: "111-111-1111", email: "jnaidu@mail.com", password: "password")

Spot.create(address: "61 Oak Grove St", price: 10, end_time: "10:00", owner: user)
Spot.create(address: "970 Howard St", price: 10, end_time: "9:00", owner: user)
Spot.create(address: "833 Bryant St", price: 20, end_time: "11:00", owner: user)
