class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :other_id
      t.string :content
      t.string :notification_url
      t.string :image_url
      t.boolean :b_read

      t.timestamps
    end
  end
end
