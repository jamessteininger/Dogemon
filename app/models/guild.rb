class Guild < ActiveRecord::Base
  belongs_to :owner, class_name: :user
  validates :owner_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :element, presence: true

  has_many :users
  has_many :pets, through: :users
  has_many :battles, through: :pets

  def guild_wins
    guild_wins = 0
    self.users.each do |f|
      f.pets.each do |p|
        if p.battles.any? 
          guild_wins = guild_wins + (p.ghost_wins + p.against_ghost_wins)
        end
      end
    end
    return guild_wins
  end
end
