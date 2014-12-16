class Friendship < ActiveRecord::Base
  validates :user_id, presence: true validates :friend_id, presence: true, class_name: User
  belongs_to :userbelongs_to: friend,
belongs_to :friend, class_name: User
end
