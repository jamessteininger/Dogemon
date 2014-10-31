class Transaction < ActiveRecord::Base
 # validates :user_id, prescence: true
  #validates :address, presence: true
  #validates :amount, presence: true
  belongs_to :user
end
