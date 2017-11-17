# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Business.create!([{
  name: 'Erics Biz'
  }])

Item.create!([
  {name: 'Beer', price: 8.00, business_id: 1},
  {name: 'Appetizer', price: 8.00, business_id: 1},
  {name: 'Entre', price: 14.00, business_id: 1}
  ])

Offer.create!([
  {business_id: 1}
  ])