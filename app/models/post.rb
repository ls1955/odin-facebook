class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments

  scope :relevant, ->(user) { where(id: [user.id] + user.all_friends.pluck(:id)) }
end
