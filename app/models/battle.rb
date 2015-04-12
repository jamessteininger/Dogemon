class Battle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :ghost_id, presence: true
  validates :pet_id, presence: true
  
  belongs_to :ghost;
  belongs_to :bounty;
  belongs_to :pet
  belongs_to :user;
  has_many :battle_logs;
  has_many :ghost_logs
  
  
  def spawn_aenemy
    
  end
  
  def apply_regen(amount)
    pet.update_attribute(:magic, pet.magic + amount)
    ghost.update_attribute(:magic, ghost.magic + amount)
    if (pet.magic > 100)
      pet.update_attribute(:magic, 100)
    end
    if (ghost.magic > 100)
      ghost.update_attribute(:magic, 100)
    end
    if (pet.magic < 0)
      pet.update_attribute(:magic, 0)
    end
    if (ghost.magic < 0)
      ghost.update_attribute(:magic, 0)
    end
    if (pet.health > 100)
      pet.update_attribute(:health, 100)
    end
    if (ghost.health > 100)
      ghost.update_attribute(:health, 100)
    end
    if (pet.health < 0)
      pet.update_attribute(:health, 0)
    end
    if (ghost.health < 0)
      ghost.update_attribute(:health, 0)
    end
  end
end
