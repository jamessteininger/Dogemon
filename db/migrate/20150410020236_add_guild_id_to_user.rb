class AddGuildIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :guild_id, :integer
  end
end
