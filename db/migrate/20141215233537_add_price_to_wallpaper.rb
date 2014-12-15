class AddPriceToWallpaper < ActiveRecord::Migration
  def change
    add_column :wallpapers, :price, :integer
  end
end
