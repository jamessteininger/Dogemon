class AddHpAndMpToPet < ActiveRecord::Migration
  def change
    add_column :pets, :health, :integer
    add_column :pets, :magic, :integer
    add_column :pets, :pvp_battle_id, :integer
    
  end
end
