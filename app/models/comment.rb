class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :town
  belongs_to :guild
end
