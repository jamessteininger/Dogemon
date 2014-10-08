class CreateItemInsts < ActiveRecord::Migration
  def change
    create_table :item_insts do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
