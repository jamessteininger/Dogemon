class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.integer :owner_id
      t.boolean :b_public
      t.string :name
      t.text :description
      t.string :element
      t.string :imageurl

      t.timestamps
    end
  end
end
