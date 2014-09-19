class AddImageUrlToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :imageurl, :string
  end
end
