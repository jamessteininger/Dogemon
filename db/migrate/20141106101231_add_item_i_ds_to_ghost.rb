class AddItemIDsToGhost < ActiveRecord::Migration
  def change
    add_column :ghosts, :item1_id, :integer
    add_column :ghosts, :item2_id, :integer
    add_column :ghosts, :item3_id, :integer
    add_column :ghosts, :item4_id, :integer
  end
end
