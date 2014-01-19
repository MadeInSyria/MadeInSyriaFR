# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new(name: "Admin", email: "admin@admin.com", password: "foobar123", password_confirmation: "foobar123", admin: true).save
category = Category.new(name: "Featured").save
User.find_by(email: 'admin@admin.com').posts.build(title: "Trash me !", content: "TEST POST - Trash me !", category_ids: category).save