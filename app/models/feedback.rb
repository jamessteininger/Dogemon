class Feedback < ActiveRecord::Base
  validates :feedback_type, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
