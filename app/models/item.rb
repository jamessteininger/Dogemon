class Item < ActiveRecord::Base
  has_many :sales
  has_many :market_item_votes, dependent: :destroy
  has_many :upvoted_users, through: :market_item_votes, source: :user
end
