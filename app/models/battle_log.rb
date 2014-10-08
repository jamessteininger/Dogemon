class BattleLog < ActiveRecord::Base
  validates :battle_id, presence: true
  validates :description, presence: true
  belongs_to :battle
end
