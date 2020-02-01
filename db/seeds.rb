# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Offer.destroy_all
Task.destroy_all
User.destroy_all

puts 'Creating users...'

user1 = User.new(email: "user1@gmail.com", password: "lewagon")
user2 = User.new(email: "user2@gmail.com", password: "lewagon")
user3 = User.new(email: "user3@gmail.com", password: "lewagon")
user4 = User.new(email: "user4@gmail.com", password: "lewagon")
admin = User.new(email: "admin@gmail.com", password: "lewagon")

puts 'Users created...'

puts 'Creating tasks...'

3.times do |index|
    Task.create!(
        user: user1,
        description: Faker::Books::Dune.quote,
        category: Faker::Job.field,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: false,
        location: Faker::Address.street_address,
        title: Faker::Marketing.buzzwords.capitalize
      )
end

3.times do |index|
    Task.create!(
        user: user2,
        description: Faker::Books::Dune.quote,
        category: Faker::Job.field,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: false,
        location: Faker::Address.street_address,
        title: Faker::Marketing.buzzwords.capitalize
      )
end

3.times do |index|
    Task.create!(
        user: user3,
        description: Faker::Books::Dune.quote,
        category: Faker::Job.field,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: false,
        location: Faker::Address.street_address,
        title: Faker::Marketing.buzzwords.capitalize
      )
end

3.times do |index|
    Task.create!(
        user: user4,
        description: Faker::Books::Dune.quote,
        category: Faker::Job.field,
        price: Faker::Number.number(digits: 2),
        due_date: Faker::Date.in_date_period(month: 2),
        remote_job: false,
        location: Faker::Address.street_address,
        title: Faker::Marketing.buzzwords.capitalize
      )
end

puts "Tasks created..."


puts 'Creating users...'

offer1 = Offer.new(user: user2, task: Task.first)
offer2 = Offer.new(user: user3, task: Task.first)
offer3 = Offer.new(user: user4, task: Task.first)
offer1.save!
offer2.save!
offer3.save!
