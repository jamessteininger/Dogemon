class Equipment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :sale
  
  validates :sale_id, presence: true
  validates :pet_id, presence: true
  
  #def sale
    #  return Sale.find(item_inst_id)
  #end
end
