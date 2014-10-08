class AddPetIdToItemInst < ActiveRecord::Migration
  def change
    add_column :item_insts, :pet_id, :integer
  end
end
