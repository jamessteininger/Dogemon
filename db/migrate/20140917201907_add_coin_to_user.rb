class AddCoinToUser < ActiveRecord::Migration
  def change
    add_column :users, :coin, :float
    add_column :users, :nickname, :string
  end
end
