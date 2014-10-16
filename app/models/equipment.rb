class Equipment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :sale
  
  def sale
      return Sale.find(item_inst_id)
 
  end
end
