# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: "American").first_or_create(name: "American")
Category.where(name: "Asian").first_or_create(name: "Asian")
Category.where(name: "Bakery").first_or_create(name: "Bakery")
Category.where(name: "Cafe").first_or_create(name: "Cafe")
Category.where(name: "Central European").first_or_create(name: "Central European")
Category.where(name: "Fast food").first_or_create(name: "Fast food")
Category.where(name: "French").first_or_create(name: "French")
Category.where(name: "Indian").first_or_create(name: "Indian")
Category.where(name: "Italian").first_or_create(name: "Italian")
Category.where(name: "Latino").first_or_create(name: "Latino")
Category.where(name: "Mediterranean").first_or_create(name: "Mediterranean")
Category.where(name: "Middle-eastern").first_or_create(name: "Middle-eastern")
Category.where(name: "Others").first_or_create(name: "Others")