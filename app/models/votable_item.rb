class VotableItem < ActiveRecord::Base
  def upvote
    update_attribute(:upvotes, self.upvotes + 1)
    update_attribute(:sumvotes, self.upvotes - self.downvotes)
  end
  def downvote
    update_attribute(:downvotes, self.downvotes + 1)
    update_attribute(:sumvotes, self.upvotes - self.downvotes)
  end
end
