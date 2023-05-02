class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :sender_id, uniqueness: { scope: :receiver_id }

  class << self
    def pending(user)
      where(sender_id: user.id).or(where(receiver_id: user.id))
    end
  end
end
