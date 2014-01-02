namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    pwd = Random.new
    pwd = pwd.rand(10000000..99999999)
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: pwd,
                 password_confirmation: pwd)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end