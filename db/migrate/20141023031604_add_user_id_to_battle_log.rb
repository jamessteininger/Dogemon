class AddUserIdToBattleLog < ActiveRecord::Migration
  def change
    add_column :battle_logs, :user_id, :integer
  end
end
