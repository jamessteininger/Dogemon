class AddAgainstWinsLossesToPets < ActiveRecord::Migration
  def change
    add_column :pets, :against_ghost_wins, :integer
    add_column :pets, :against_ghost_losses, :integer
  end
end
