require 'faker'
$tags
pepper = "https://res.cloudinary.com/esmeberder/image/upload/v1564651218/pepper.jpg"
admin = User.create!(
  name: "Esme Li",
  email: "esmeyangli@gmail.com",
  password: '123456',
  password_confirmation: '123456',
  admin: true
)
admin.remote_photo_url = pepper
admin.save

puts "created admin"

actors = [
  {name: "Angelina Jolie", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564627969/angelinajolie.jpg"},
  {name: "Will Smith", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559065/willsmith.jpg"},
  {name: "Jennifer Lawrence", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559414/jenniferlawrence.jpg"},
  {name: "Tom Cruise", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559453/tomcruise.jpg"},
  {name: "Mila Kunis", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559521/milakunis.jpg"},
  {name: "Matt Damon", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559577/mattdamon.jpg"},
  {name: "Ryan Gosling", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559642/ryangosling.jpg"},
  {name: "Emily Blunt", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559687/emilyblunt.jpg"},
  {name: "Chris Pratt", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564635622/chrispratt.jpg"},
  {name: "Emma Stone", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559838/emmastone.jpg"},
  {name: "Scarlett Johansson", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559745/scarlettjohansson.jpg"},
  {name: "Steve Carell", photo: "https://res.cloudinary.com/esmeberder/image/upload/v1564559787/stevecarell.jpg"}
]

actors.each do |actor|
  email = "#{actor[:name].gsub(" ","")}@gmail.com"
  user = User.create!(
    name: actor[:name],
    email: email,
    bio: Faker::Quotes::Shakespeare.hamlet_quote,
    tag_list: ["Actor", "Broadway", "Musician", "Athlete", "Funny", "Dramatic", "Romantic Comedies", "ComicCon"].sample(3),
    password: '123456789',
    password_confirmation: '123456789',
    star: true
  )
  user.remote_photo_url = actor[:photo]
  user.save
  s1 = Service.create!(
    title: "Shoutout",
    description: "Let me know who you want to give a shoutout to and I'll record a 2 min video!",
    price: 2000,
    user_id: user.id
  )
  Booking.create!(
    recipient: "John",
    instructions: "John's your biggest fan! Can you wish him a Merry Christmas?",
    user_id: admin.id,
    service_id: s1.id
  )
  s2 = Service.create!(
    title: "Phone call",
    description: "I'll call anyone you want to talk for 30 seconds!",
    price: 5000,
    user_id: user.id
  )
  Booking.create!(
    recipient: "Oki",
    instructions: "My name is Esme. Could you give my friend Oki a birthday shoutout?",
    user_id: admin.id,
    service_id: s2.id
  )
  s3 = Service.create!(
    title: "Guest Appearance",
    description: "I'll make a 1-hour guest appearance.",
    price: 100000,
    user_id: user.id
  )
  Booking.create!(
    recipient: "Jinhong",
    instructions: "Can you make a guest appearance for Jinhong's wedding?",
    user_id: admin.id,
    service_id: s3.id
  )
end


puts "Created #{actors.count} stars"
puts "Created #{(Service.count / actors.size)} services per actor"

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
