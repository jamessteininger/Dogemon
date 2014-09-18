class Sale < ActiveRecord::Base
  validates :user_id, presence: true
  validates :item_id, presence: true
  belongs_to :user
end
