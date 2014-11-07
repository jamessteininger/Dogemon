class AddRandomAmountToGhostLog < ActiveRecord::Migration
  def change
    add_column :ghost_logs, :rand_amount, :integer
  end
end
