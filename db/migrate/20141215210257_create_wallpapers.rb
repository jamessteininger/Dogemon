class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :imageurl
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
