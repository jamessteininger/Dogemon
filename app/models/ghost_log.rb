class GhostLog < ActiveRecord::Base
  validates :pet_id, presence: true
  validates :item_id, presence: true
  validates :utility_type, presence: true
end
