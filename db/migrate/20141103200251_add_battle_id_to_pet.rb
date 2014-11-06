class AddBattleIdToPet < ActiveRecord::Migration
  def change
    add_column :pets, :battle_id, :integer
  end
end
