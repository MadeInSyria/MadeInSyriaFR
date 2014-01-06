namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    pwd = Random.new
    pwd = pwd.rand(10000000..99999999)
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: pwd,
                 password_confirmation: pwd,
                 admin: true)
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 20)
    2.times do
      title = Faker::Lorem.sentence(1)
      content = Faker::Lorem.paragraphs(10)
      users.each { |user| user.posts.create!(content: content, title: title) }
    end
  end
end