class CreateBattleMoves < ActiveRecord::Migration
  def change
    create_table :battle_moves do |t|
      t.integer :battle_id
      t.integer :attacker_id
      t.integer :defender_id
      t.string :move_type
      t.integer :move_amount

      t.timestamps
    end
  end
end
