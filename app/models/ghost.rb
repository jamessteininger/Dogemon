class Ghost < ActiveRecord::Base
  belongs_to :battle
  belongs_to :pet
  belongs_to :user
  
  validates :health, presence: true
  validates :magic, presence: true
  validates :pet_id, presence: true
  validates :element, presence: true
  validates :name, presence: true
  validates :imageurl, format: {
    :with => %r{\.(gif|jpe?g|png)$}i, multiline: true, 
  message: 'must be a url for gif, jpg, or png image.'
}
  
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
