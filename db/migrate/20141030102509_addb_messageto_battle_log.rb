class AddbMessagetoBattleLog < ActiveRecord::Migration
  def change
    add_column :battle_logs, :bMessage, :bool
  end
end
