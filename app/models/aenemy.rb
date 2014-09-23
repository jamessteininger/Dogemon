class Aenemy < ActiveRecord::Base
  validates :battle_id, presence: true
  validates :health, presence: true
  validates :attack, presence: true
  validates :imageurl, presence: true
  belongs_to :battle
  
  def take_damage(amount)
    update_attribute(:health, self.health-amount)
  end
end
