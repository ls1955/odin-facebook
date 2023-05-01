# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  User.create(email: "user#{i}@coldmail.com", password: "kuma123")
  Post.create(body: "Hello.", user_id: i)
end

(2..9).each { |i| FriendRequest.create(sender_id: 1, receiver_id: i) }
(3..9).each { |i| Friendship.create(user_id: 2, friend_id: i) }
