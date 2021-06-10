User.create!(name: "空条承太郎",
             email: "starplatina@oraora.com",
             password: "oraora",
             password_confirmation: "oraora",
             introduction: "やれやれだぜ")

User.create!(name: "花京院典明",
             email: "thehierophant@green.com",
             password: "emeraldsplash",
             password_confirmation: "emeraldsplash",
             introduction: "レロレロレロレロ")

User.create!(name: "モハメド・アヴドゥル",
             email: "magicians@red.com",
             password: "crossfireharricane",
             password_confirmation: "crossfireharricane",
             introduction: "YES I AM!")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Book.title
  body = Faker::Lorem.sentence(word_count: 15)
  users.each { |user| user.books.create!(title: title, body: body) }
end