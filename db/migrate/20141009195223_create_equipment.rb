class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :pet_id
      t.integer :item_inst_id

      t.timestamps
    end
  end
end
