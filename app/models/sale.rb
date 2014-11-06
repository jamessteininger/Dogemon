class Sale < ActiveRecord::Base
  validates :user_id, presence: true
  validates :item_id, presence: true
  has_one :equipment, dependent: :destroy
  belongs_to :item
  belongs_to :user
  
  def name
    if Item.exists?(item_id)
      return Item.find(item_id).name
    end
  end
  def element
    if Item.exists?(item_id)
      return Item.find(item_id).element
    end
  end
  def attack
    if Item.exists?(item_id)
      return Item.find(item_id).attack
    end
  end
  def magic
    if Item.exists?(item_id)
      return Item.find(item_id).magic
    end
  end
  def battle_cost
    if Item.exists?(item_id)
      return "ATK: " + Item.find(item_id).attack.to_s + " | MGK: " + Item.find(item_id).magic.to_s
    end
  end
end
