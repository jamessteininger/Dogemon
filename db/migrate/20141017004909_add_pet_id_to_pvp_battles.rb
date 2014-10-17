class AddPetIdToPvpBattles < ActiveRecord::Migration
  def change
    add_column :pvp_battles, :pet1_id, :integer
    add_column :pvp_battles, :pet2_id, :integer
    add_column :pvp_battles, :winner_id, :integer
  end
end
