class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :equipments
  belongs_to :pvp_battle
  has_many :item_insts, through: :equipments
  
  def take_damage(amount)
    update_attribute(:health, self.health-amount)
  end
  
  def use_magic(amount)
    update_attribute(:magic, self.magic-amount)
  end
end
