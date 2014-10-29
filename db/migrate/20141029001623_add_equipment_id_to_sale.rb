class AddEquipmentIdToSale < ActiveRecord::Migration
  def change
    add_column :sales, :equipment_id, :integer
  end
end
