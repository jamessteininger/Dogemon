class AddCreatorToItem < ActiveRecord::Migration
  def change
    add_column :items, :creator_id, :integer
    add_column :items, :downloads, :integer
  end
end
