# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Pet.create!(
  name: "Emilia",
  age: 4,
  category: 0,
  address: "54 Broadway Market",
  postcode: "E84QJ",
  description: "Hello, I'm travelling for some days and need someone to chill with my dog. She is very lazy",
  price: 20,
  start_date: "2024-02-22",
  end_date: "2024-02-25",
  photo: "https://source.unsplash.com/random/?dog"
)
