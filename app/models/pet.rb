class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :item_insts
end
