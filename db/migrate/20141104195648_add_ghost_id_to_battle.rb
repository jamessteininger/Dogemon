class AddGhostIdToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :ghost_id, :integer
  end
end
