# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user1 = User.new(email: "user1@gmail.com", password: "lewagon")
user2 = User.new(email: "user2@gmail.com", password: "lewagon")
user3 = User.new(email: "admin@gmail.com", password: "lewagon")

5.times do
    Task.create!( 
        user: user1,
        description: Faker::Marketing.buzzwords,
        category: Faker::Job.field ,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: true,
        location: Faker::Address.street_address
      )
end

5.times do
    Task.create!( 
        user: user2,
        description: Faker::Marketing.buzzwords,
        category: Faker::Job.field ,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: true,
        location: Faker::Address.street_address
      )
end

5.times do
    Task.create!( 
        user: user3,
        description: Faker::Marketing.buzzwords,
        category: Faker::Job.field ,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: true,
        location: Faker::Address.street_address
      )
end



# 5.times do
#     User.create! ([
#         {
#            email: Faker::Internet.email,
#            password: lewagon
#         }
#     ])

# end

