class Ghost < ActiveRecord::Base
  belongs_to :battle
  belongs_to :pet
  belongs_to :user
end
