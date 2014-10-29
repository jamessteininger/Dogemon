class AddSaleIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :sale_id, :integer
  end
end
