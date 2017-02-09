# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Spot.destroy_all

user = User.create(first_name: "Jay", last_name: "Naidu", username: "jnaidu", phone: "9522886648", email: "jnaidu@mail.com", password: "password")
user2 = User.create(first_name: "Bob", last_name: "Yboy", username: "bob", phone: "8083428500", email: "bob@mail.com", password: "password")

Spot.create(address: "61 Oak Grove St, San Francisco, CA", picture: open("parkingspot.jpg"), price: 10, end_time: "10:00", owner: user)
Spot.create(address: "970 Howard St, San Francisco, CA", picture: open("parkingspot.jpg"), price: 10, end_time: "9:00", owner: user)
Spot.create(address: "833 Bryant St, San Francisco, CA", picture: open("parkingspot.jpg"), price: 20, end_time: "11:00", owner: user)

Spot.create(address: "255 3rd Street, San Francisco, CA, 94103", picture: open("parkingspot.jpg"), price: 5, end_time: "10:00", owner: user2)
Spot.create(address: "390 1st St, San Francisco, CA 94105", picture: open("parkingspot.jpg"), price: 15, end_time: "9:00", owner: user2)