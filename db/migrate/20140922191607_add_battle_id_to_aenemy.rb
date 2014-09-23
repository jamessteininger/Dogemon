class AddBattleIdToAenemy < ActiveRecord::Migration
  def change
    add_column :aenemies, :battle_id, :integer
  end
end
