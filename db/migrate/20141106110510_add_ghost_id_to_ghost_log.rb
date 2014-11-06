class AddGhostIdToGhostLog < ActiveRecord::Migration
  def change
    add_column :ghost_logs, :ghost_id, :integer
  end
end
