class AddItemBattleType < ActiveRecord::Migration
  def change
    add_column :items, :utility_type, :string
  end
end
