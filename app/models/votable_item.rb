class VotableItem < ActiveRecord::Base
  def upvote
    update_attribute(:upvotes, self.upvotes + 1)
  end
  def downvote
    update_attribute(:upvotes, self.upvotes - 1)
  end
end
