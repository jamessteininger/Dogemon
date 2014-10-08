class AddUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :town_id, :integer
    add_column :users, :bio, :text
    add_column :users, :dogetag, :string
    add_column :users, :imageurl, :string
  end
end
