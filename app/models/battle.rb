class Battle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :ghost_id, presence: true
  validates :pet_id, presence: true
  
  belongs_to :ghost;
  belongs_to :pet
  belongs_to :user;
  has_many :battle_logs;
  
  
  def spawn_aenemy
    
  end
end
