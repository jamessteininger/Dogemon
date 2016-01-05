class AddTownIdToGuild < ActiveRecord::Migration
  def change
    add_column :towns, :resource_url, :string
    add_column :towns, :resource_name, :string
    add_column :guilds, :town_id, :integer
  end
end
