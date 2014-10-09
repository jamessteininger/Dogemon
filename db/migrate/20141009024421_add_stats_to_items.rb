class AddStatsToItems < ActiveRecord::Migration
  def change
    add_column :items, :element, :string
    add_column :items, :category, :string
    add_column :items, :attack, :integer
  end
end
