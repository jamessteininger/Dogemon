class Battle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :enemy_id, presence: true
  has_many :aenemies; 
  has_one :user;
  
  
  def spawn_aenemy
    
  end
end
