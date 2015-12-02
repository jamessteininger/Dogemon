class AddModerationBooleansToModels < ActiveRecord::Migration
  def change
    add_column :items, :b_mod_blocked, :boolean
    add_column :users, :b_mod_blocked, :boolean
    add_column :colusseums, :b_mod_blocked, :boolean
    add_column :guilds, :b_mod_blocked, :boolean
    add_column :pets, :b_mod_blocked, :boolean
    add_column :towns, :b_mod_blocked, :boolean
  end
end
