class Battle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :enemy_id, presence: true
  has_one :aenemy; 
  has_one :user;
  
end
