class AddGhostWinsLossesToDogemon < ActiveRecord::Migration
  def change
    add_column :pets, :ghost_wins, :integer
    add_column :pets, :ghost_losses, :integer
  end
end
