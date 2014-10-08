class Battle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :enemy_id, presence: true
  has_many :aenemies; 
  has_one :user;
  has_many :battle_logs;
  
  
  def spawn_aenemy
    
  end
end
