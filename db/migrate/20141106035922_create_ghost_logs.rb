class CreateGhostLogs < ActiveRecord::Migration
  def change
    create_table :ghost_logs do |t|
      t.integer :battle_id
      t.string :description
      t.string :type
      t.boolean :bMessage
      t.integer :item_id
      t.integer :pet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
