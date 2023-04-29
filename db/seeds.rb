# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "user1@coldmail.com", password: "kuma123")
User.create(email: "user2@coldmail.com", password: "kuma123")
User.create(email: "user3@coldmail.com", password: "kuma123")
Post.create(body: "Howdy.", user_id: 1)
Post.create(body: "Hello", user_id: 2)
Post.create(body: "I would like to go home.", user_id: 3)
