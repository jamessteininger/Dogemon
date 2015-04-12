class Bounty < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user
  has_many :battles
end
