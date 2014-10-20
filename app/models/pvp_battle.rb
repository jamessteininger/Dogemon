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
end
