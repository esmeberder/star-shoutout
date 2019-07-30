
actors = ["Angelina Jolie", "Will Smith", "Jennifer Lawrence", "Tom Cruise", "Mila Kunis", "Matt Damon", "Ryan Gosling", "Emily Blunt","Chris Pratt", "Emma Stone", "Scarlett Johansson", "Steve Carell"]
actors.each do |actor|
  email = "#{actor.gsub(" ","")}@gmail.com"
  user = User.create!(
    name: actor,
    email: email,
    password: '123456789',
    password_confirmation: '123456789',
    star: true
  )
  Service.create!(
    title: "Shoutout",
    description: "Let me know who you want to give a shoutout to and I'll record a 2 min video!",
    price: 200,
    user_id: user.id
  )
  Service.create!(
    title: "Phone call",
    description: "I'll call anyone you want to talk for 30 seconds!",
    price: 500,
    user_id: user.id
  )
  Service.create!(
    title: "Guest Appearance",
    description: "I'll make a 1-hour guest appearance.",
    price: 10_000,
    user_id: user.id
  )
end

puts "Created #{actors.count} stars"
puts "Created #{(Service.count / actors.size)} services per actor"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
