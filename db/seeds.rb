# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

image_link1 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708792938/_132346054_2024-01-16t213506z_1605027692_rc2c4z9zxs95_rtrmadp_3_portugal-dog-record-age_grpzsg.jpg"
image_link2 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708792938/dog-adoption-4-ht-thg-231102_1698927699896_hpEmbed_1x1_duio3n.jpg"
image_link3 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708792938/closeup-of-a-black-russian-tsvetnaya-bolonka-royalty-free-image-1681161235.jpg_nhnwqk.jpg"
image_link4 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708792995/124530_yea2aq.jpg"
image_link5 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708792993/wisp-the-cat-from-tiktok-092823-1-74797b02afe7475295e1478b2cdf2883_m2xkqk.jpg"
image_link6 = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1708793048/900_llvp5l.jpg"
file_1 = URI.open(image_link1)
file_2 = URI.open(image_link2)
file_3 = URI.open(image_link3)
file_4 = URI.open(image_link4)
file_5 = URI.open(image_link5)
file_6 = URI.open(image_link6)

pet = Pet.new(
  name: "Emilia",
  age: 4,
  address: "54 Broadway Market",
  postcode: "E84QJ",
  city: "London",
  country: "United Kingdom",
  description: "Hello, I need someone to take care of my dog for a couple of days please!",
  price: 20,
  category: "Dog",
  start_date: "2024-02-28",
  end_date: "2024-03-04",
  user_id: 1,
  seeding: true
)
pet.save!
pet.photo.attach(io: file_1, filename: 'first_dog.jpg', content_type: 'image/jpg')

pet2 = Pet.new(
  name: "Felix",
  age: 3,
  address: "9383 Church Lane",
  postcode: "W5380Q",
  city: "London",
  country: "United Kingdom",
  description: "Felix is very well behaved but very active. I'm looking for someone that can keep up with him and take him for walkies while I'm gone",
  price: 35,
  category: "Dog",
  start_date: "2024-03-01",
  end_date: "2024-03-05",
  user_id: 1,
  seeding: true
)
pet2.save!
pet2.photo.attach(io: file_2, filename: 'second_dog.jpg', content_type: 'image/jpg')

pet3 = Pet.new(
  name: "Fausto",
  age: 6,
  address: "67 Windsor Road",
  postcode: "NN58LB",
  city: "Northamptom",
  country: "United Kingdom",
  description: "Hi! I will be travelling for 10 days and desperately need someone to take care of Fausto. Please, message me if you are in my area!",
  price: 18,
  category: "Dog",
  start_date: "2024-02-29",
  end_date: "2024-03-09",
  user_id: 1,
  seeding: true
)
pet3.save!
pet3.photo.attach(io: file_3, filename: 'third_dog.jpg', content_type: 'image/jpg')

pet4 = Pet.new(
  name: "Meredith",
  age: 5,
  address: "81 Springfield Road",
  postcode: "SW49 0AT",
  city: "London",
  country: "United Kingdom",
  description: "Meredith is looking for someone to take care of her while I'm in Spain. Please, message me asap if you are avaiable.",
  price: 25,
  category: "Cat",
  start_date: "2024-03-01",
  end_date: "2024-03-09",
  user_id: 1,
  seeding: true
)
pet4.save!
pet4.photo.attach(io: file_4, filename: 'first_cat.jpg', content_type: 'image/jpg')

pet5 = Pet.new(
  name: "Karl",
  age: 2,
  address: "52 Kleistraat",
  postcode: "3740",
  city: "Limburg",
  country: "Belgium",
  description: "My baby Karl needs a petsitter for a week and a bit. He is really cute and cuddly.. any takers?",
  price: 15,
  category: "Cat",
  start_date: "2024-03-02",
  end_date: "2024-03-11",
  user_id: 1,
  seeding: true
)
pet5.save!
pet5.photo.attach(io: file_5, filename: 'second_cat.jpg', content_type: 'image/jpg')

pet6 = Pet.new(
  name: "Ruby",
  age: 6,
  address: "6 A Theresenweg",
  postcode: "13505",
  city: "Berlin",
  country: "Germany",
  description: "Ruby needs a petsitter as I am travelling. He is great company and loves to watch TV. Message me if you are available.",
  price: 18,
  category: "Bird",
  start_date: "2024-02-28",
  end_date: "2024-03-11",
  user_id: 1,
  seeding: true
)
pet6.save!
pet6.photo.attach(io: file_6, filename: 'parrot.jpg', content_type: 'image/jpg')
