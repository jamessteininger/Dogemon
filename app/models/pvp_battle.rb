class PvpBattle < ActiveRecord::Base
  validates :user_id, presence: true
  validates :other_id, presence: true
  
  belongs_to :user;
  
end
