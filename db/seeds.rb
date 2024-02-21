# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Pet.create!(name: "Fruna",
age: 3, address: "54 Broadway Market",
postcode: "E84QJ",
description: "I'm travelling for 2 weeks and need someone to take care of my very well behaved dog.",
price: 20,
start_date:"2024-03-02",
end_date: "2024-03-16",
category: 0,
user_id: 1,
photo:"https://source.unsplash.com/random/?dog")
