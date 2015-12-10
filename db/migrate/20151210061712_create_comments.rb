class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :town_id
      t.text :content
      t.text :body_html
      t.text :body
      t.integer :upvotes
      t.integer :downvotes
      t.integer :guild_id

      t.timestamps
    end
  end
end
