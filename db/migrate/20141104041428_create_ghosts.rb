class CreateGhosts < ActiveRecord::Migration
  def change
    create_table :ghosts do |t|
      t.integer :pet_id
      t.string :name
      t.float :health
      t.float :magic
      t.text :description
      t.integer :user_id
      t.string :element
      t.string :imageurl
      t.integer :battle_id

      t.timestamps
    end
  end
end
