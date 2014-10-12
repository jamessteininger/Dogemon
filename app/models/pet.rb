class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :equipments
  has_many :item_insts, through: :equipments
end
