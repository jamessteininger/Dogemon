class AddPvpBattleIdToBattleLog < ActiveRecord::Migration
  def change
    add_column :battle_logs, :pvp_battle_id, :integer
  end
end
