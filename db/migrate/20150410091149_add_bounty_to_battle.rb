class AddBountyToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :bounty_id, :integer
  end
end
