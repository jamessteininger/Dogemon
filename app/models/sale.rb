class Sale < ActiveRecord::Base
  validates :user_id, presence: true
  validates :item_id, presence: true
  belongs_to :user
  
  def name
    if Item.exists?(item_id)
      return Item.find(item_id).name
    end
  end
end
