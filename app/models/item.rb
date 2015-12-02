class Item < ActiveRecord::Base
  scope :mod_blocked, -> { where(b_mod_blocked: true) } 
  scope :not_mod_blocked, -> { where("b_mod_blocked = nil OR b_mod_blocked = false") }
  
  has_many :sales
  has_many :market_item_votes, dependent: :destroy
  has_many :upvoted_users, through: :market_item_votes, source: :user
  validates :worth, numericality: true
  validates :name, presence: true
  validates :element, presence: true
  validates :attack, presence: true
  validates :utility_type, presence: true
  validates :magic, presence: true
  validates :description, presence: true
  validates :imageurl, presence: true
  belongs_to :creator, class_name: User
end
