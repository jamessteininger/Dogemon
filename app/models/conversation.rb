class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :other, class_name: "User"
  has_many :messages
end
