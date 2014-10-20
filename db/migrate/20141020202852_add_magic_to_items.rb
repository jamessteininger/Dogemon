class AddMagicToItems < ActiveRecord::Migration
  def change
    add_column :items, :magic, :integer
    add_column :items, :turns, :integer
    add_column :items, :boost, :float
  end
end
