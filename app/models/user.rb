class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :friend_requests, foreign_key: "receiver_id"
  # has_many :sent_friend_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  # has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "FriendRequest"
  # has_many :pending_friend_requests, -> { where status: "pending" }, class_name: "FriendRequest", foreign_key: :receiver_id
  # has_many :accepted_friend_requests, -> { where status: "accepted" }, class_name: "FriendRequest", foreign_key: :receiver_id
  # has_many :rejected_friend_requests, -> { where status: "rejected" }, class_name: "FriendRequest", foreign_key: :receiver_id
  # has_many :friends, class_name: "User", foreign_key: "user_id"
  # belongs_to :user, optional: true
end
