class AddWinsLossesPets < ActiveRecord::Migration
  def change
    add_column :pets, :player_wins, :integer
    add_column :pets, :player_losses, :integer
    add_column :pets, :favorite_activity, :string
    add_column :pets, :disposition, :string
  end
end
