class Friendship < ActiveRecord::Base
  validates :user_id, presence: true validates :friend_id, presence: true, class_name: User
end
