class AddTotalCoinMadeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coin_made, :float
  end
end
