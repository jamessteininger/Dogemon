class AddPetIdToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :pet_id, :integer
    add_column :battles, :b_pet_turn, :bool
    add_column :battles, :b_pet_winner, :bool
    add_column :battles, :battle_state, :string
  end
end
