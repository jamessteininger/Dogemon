class AddBOriginalArtToItems < ActiveRecord::Migration
  def change
    add_column :items, :b_original_art, :boolean
  end
end
