class Equipment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :item_inst
end
