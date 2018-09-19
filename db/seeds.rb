User.create!(name: "Examples User",
        email: "example@railstutrial.org",
        password: "foobar",
        password_confirmation: "foobar",
        admin: true,
        activated: true,
        activated_at: Time.zone.now)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
50.times do
  context = Faker::Lorem.sentence(5)
  users.each{ |user| user.microposts.create!(context: context)}
end

# relations
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

