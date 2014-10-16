class CreatePvpBattles < ActiveRecord::Migration
  def change
    create_table :pvp_battles do |t|
      t.integer :user_id
      t.integer :other_id
      t.string :battle_state
      t.boolean :user1_turn

      t.timestamps
    end
  end
end
