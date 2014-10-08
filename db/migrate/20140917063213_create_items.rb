class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :worth
      t.string :imageurl

      t.timestamps
    end
  end
end
