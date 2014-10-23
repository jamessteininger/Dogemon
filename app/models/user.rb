class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :dogetag, presence: true
  
  has_many :sales, dependent: :destroy
  has_many :logs
  has_many :pets
  has_many :item_insts
  #has_one :town
  has_many :market_item_votes, dependent: :destroy
  has_many :upvoted_items, through: :market_item_votes, source: :item
  
  def add_coin(amount)
    update_attribute(:coin, self.coin+amount)
  end
  
  def set_town(town)
    update_attribute(:town_id, town)
  end 
end
