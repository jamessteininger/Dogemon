class CreateMarketItemVotes < ActiveRecord::Migration
  def change
    create_table :market_item_votes do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
