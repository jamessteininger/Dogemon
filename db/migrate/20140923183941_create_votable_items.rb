class CreateVotableItems < ActiveRecord::Migration
  def change
    create_table :votable_items do |t|
      t.integer :upvotes
      t.integer :downvotes
      t.integer :sumvotes
      t.string :imageurl
      t.string :name
      t.text :description
      t.float :worth
      t.integer :creator_id

      t.timestamps
    end
  end
end
