class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :dogetag, presence: true
  validates :imageurl, presence: true
  validates :if_accepted_terms, presence: true
  has_many :transactions
  has_many :sales, dependent: :destroy
  has_many :logs
  has_many :pvp_battles, class_name: 'PvpBattle', foreign_key: 'user_id'
  has_many :pvp_battles_p2, class_name: 'PvpBattle', foreign_key: 'other_id'
  has_many :battles, class_name: 'Battle', foreign_key: 'user_id'
  has_many :pets
  has_many :item_insts
  has_many :items, foreign_key: 'creator_id'
  #has_one :town
  has_many :market_item_votes, dependent: :destroy
  has_many :upvoted_items, through: :market_item_votes, source: :item
  
  def add_coin(amount)
    update_attribute(:coin, self.coin+amount)
  end
  
  def set_town(town)
    update_attribute(:town_id, town)
  end 
  
  def num_active_turns
    numTurns = 0
    self.pvp_battles.where("battle_state = 'in_progress'").each do |f|
      if (f.user_id == self.id)
        if (f.user1_turn)
          numTurns += 1
        end
      end
      if (f.other_id == self.id)
        if (!f.user1_turn)
          numTurns += 1
        end
      end
    end
    self.pvp_battles_p2.where("battle_state = 'in_progress'").each do |f|
      if (f.user_id == self.id)
        if (f.user1_turn)
          numTurns += 1
        end
      end
      if (f.other_id == self.id)
        if (!f.user1_turn)
          numTurns += 1
        end
      end
    end
    #return self.pvp_battles.where("battle_state = 'in_progress' and user1_turn = 'true'").count + self.pvp_battles_p2.where("battle_state = 'in_progress'").count
    return numTurns
  end
end
