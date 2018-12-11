# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


albert = User.create name: 'Albert Einstein'
david = User.create name: 'David Gauke'
tina = User.create name: 'Tina Turner'



OysterCard.create user: albert, balance: 35_40
OysterCard.create user: david, balance: 0
OysterCard.create user: tina, balance: 3_255_60

