# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

category = {}
category["Education"] = "http://www.lancasterchristianacademy.org/images/systemic-evaluation.jpg"
category["Housework"] = "https://assets.blog.hgtv.ca/wp-content/hgtv-wp/2017/04/Couples-Cleaning-Household-Chores-Blog-Feature.jpg"
category["Moving"] = "https://i1.wp.com/movingtips.wpengine.com/wp-content/uploads/2019/02/moving-boxes-crosscountry.jpg"
category["Other"] = "https://avante.biz/wp-content/uploads/Just-do-it-later-wallpaper/Just-do-it-later-wallpaper66.jpg"
category["Photography"] = "https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j-1024-80.jpg"
category["Shopping"] = "https://www.gannett-cdn.com/-mm-/75f94cbbc5756a3f1c2135ee55d2689771f4045e/c=136-0-2312-1224/local/-/media/2019/11/27/USATODAY/usatsports/shopping-bags-held-by-lady.jpg"
category["Translation"] = "https://www.at-languagesolutions.com/en/wp-content/uploads/2018/02/translate.jpg"
category["Local guides"] = "https://i.gadgets360cdn.com/large/google_maps_full_1574071253835.jpg"
category["Experiences"] = "https://www.awardstaffing.com/wp-content/uploads/2018/11/Why-You-Need-Have-a-Wide-Range-of-Job-Experiences-in-Minnesota-1030x580.jpg"
category["Health and Beauty"] = "https://cdn3.f-cdn.com/contestentries/2235/1880497/10714-6282-13186713374e9953e9ec666/Your-Health-and-Beauty01_thumb900.jpg"
category["Maintenance/repairs"] = "https://d2y1pz2y630308.cloudfront.net/11672/pictures/2015/8/maintenance-and-repair-big.png"

puts 'Cleaning database...'
Offer.destroy_all
Task.destroy_all
User.destroy_all

puts 'Creating users...'
users = []
users << User.new(email: "user1@gmail.com", password: "lewagon")
users << User.new(email: "user2@gmail.com", password: "lewagon")
users << User.new(email: "user3@gmail.com", password: "lewagon")
users << User.new(email: "user4@gmail.com", password: "lewagon")
users << User.new(email: "admin@gmail.com", password: "lewagon")

puts 'Users created...'

puts 'Creating tasks...'
users.each do |user|
  3.times do |index|
    temp = category.to_a.sample
      task = Task.new(
          user: user,
          description: Faker::Books::Dune.quote,
          category: temp[0],
          price: Faker::Number.number(digits: 2),
          due_date: Faker::Date.in_date_period(month: 2),
          remote_job: false,
          location: Faker::Address.street_address,
          title: Faker::Marketing.buzzwords.capitalize
        )
    puts task.category
    file = URI.open(temp[1])
    task.photo.attach(io: file, filename: task.title, content_type: 'image/png')
    task.save

  end
end

puts "Tasks created..."

puts 'Creating users...'

offer1 = Offer.new(user: users[1], task: Task.first)
offer2 = Offer.new(user: users[2], task: Task.first)
offer3 = Offer.new(user: users[3], task: Task.first)
offer1.save!
offer2.save!
offer3.save!

puts "Offers created"