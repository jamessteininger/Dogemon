class Town < ActiveRecord::Base
 # has_many :users
  has_many :comments
  belongs_to :user
 # has_one :north_town, class_name: Town
  def north_town
    if self.north_id.presence
      return Town.find(self.north_id)
    else
      return self
    end
  end
  def south_town
    if self.south_id.presence
      return Town.find(self.south_id)
    else
      return self
    end
  end
  def east_town
    if self.east_id.presence
      return Town.find(self.east_id)
    else
      return self
    end
  end
  def west_town
    if self.west_id.presence
      return Town.find(self.west_id)
    else
      return self
    end
  end
end
