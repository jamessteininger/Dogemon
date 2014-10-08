class ItemInst < ActiveRecord::Base
  validates :user_id, presence: true
  validates :item_id, presence: true
  belongs_to :pet
end
