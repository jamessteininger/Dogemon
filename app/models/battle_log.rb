class BattleLog < ActiveRecord::Base
 # validates :battle_id, presence: true
  validates :description, presence: true
  validates :pvp_battle_id, presence: true
  belongs_to :battle
  belongs_to :pvp_battle
  belongs_to :user
end
