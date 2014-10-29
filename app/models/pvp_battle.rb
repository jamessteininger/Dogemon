class PvpBattle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :other_id, presence: true
  
  validates :pet1_id, presence: true
  validates :pet2_id, presence: true
  
  belongs_to :user;
  belongs_to :other, class_name: 'User'
  
  belongs_to :pet1, class_name: 'Pet';
  belongs_to :pet2, class_name: 'Pet';
  
  has_many :battle_logs;
  
  accepts_nested_attributes_for :user, :other, :pet1, :pet2
  
  def whose_turn(current_user_id)
    if (self.user1_turn)
      if (self.user.id == current_user_id)
        return "It is your turn."
      else
        return "It is " + user.dogetag + "'s turn."
      end
    end
    if (!self.user1_turn)
      if (self.other.id == current_user_id)
        return "It is your turn."
      else
        return "It is " + other.dogetag + "'s turn."
      end
    end
  end
  
  def restore_health
    pet1.update_attribute(:health, 100)
    pet2.update_attribute(:health, 100)
    if (pet1.health > 100)
      pet1.update_attribute(:health, 100)
    end
    if (pet2.health > 100)
      pet2.update_attribute(:health, 100)
    end
    if (pet1.health < 0)
      pet1.update_attribute(:health, 0)
    end
    if (pet2.health < 0)
      pet2.update_attribute(:health, 0)
    end
  end
  
  def apply_regen(amount)
    pet1.update_attribute(:magic, pet1.magic + amount)
    pet2.update_attribute(:magic, pet2.magic + amount)
    if (pet1.magic > 100)
      pet1.update_attribute(:magic, 100)
    end
    if (pet2.magic > 100)
      pet2.update_attribute(:magic, 100)
    end
    if (pet1.magic < 0)
      pet1.update_attribute(:magic, 0)
    end
    if (pet2.magic < 0)
      pet2.update_attribute(:magic, 0)
    end
  end
end
