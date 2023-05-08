class User < ApplicationRecord
  class << self
    def from_omniauth(auth)
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_one :profile
  has_many :posts
  has_many :comments, foreign_key: "author_id"
  has_many :friend_requests, foreign_key: "receiver_id"
  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "FriendRequest"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def strangers
    User.where.not(id: [id] + all_friends.pluck(:id) + FriendRequest.pending(self).pluck(:sender_id, :receiver_id))
  end

  def all_friends
    User.where(id: friend_ids + inverse_friend_ids)
  end
end
