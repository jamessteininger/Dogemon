class AddBlockWalletIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :block_io_wallet_id, :integer
  end
end
