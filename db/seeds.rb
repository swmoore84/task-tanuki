# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
    Task.create!([
       { 
        description: Faker::FunnyName.name,
        category: Faker::Alphanumeric.alpha(number: 5),
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: true,
        location: Faker::Address.street_address
       }
    ])
end

