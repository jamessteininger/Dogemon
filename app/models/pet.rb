class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :equipments, dependent: :destroy
  belongs_to :pvp_battle, dependent: :destroy
  has_many :battles
  belongs_to :battle, dependent: :destroy
  has_many :sales, through: :equipments
  has_many :bounties
  
  accepts_nested_attributes_for :pvp_battle
  
  validates :health, presence: true
  validates :magic, presence: true
  validates :element, presence: true
  validates :name, presence: true
  validates :imageurl, format: {
    :with => %r{\.(gif|jpe?g|png)$}i, multiline: true, 
  message: 'must be a url for gif, jpg, or png image.'
}
  validates :description, presence: true
  
  def rank
    return Pet.count
  end
  
  def take_damage(amount)
    update_attribute(:health, self.health-amount)
  end
  
  def take_magic_damage(amount)
    update_attribute(:magic, self.magic-amount)
  end
  
  def heal_health(amount)
    update_attribute(:health, self.health+amount)
  end
  
  def use_magic(amount)
    update_attribute(:magic, self.magic-amount)
  end
end
