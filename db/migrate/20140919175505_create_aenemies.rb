class CreateAenemies < ActiveRecord::Migration
  def change
    create_table :aenemies do |t|
      t.integer :health
      t.integer :attack
      t.integer :defense
      t.string :element
      t.integer :coin
      t.integer :experience
      t.string :name
      t.string :description
      t.string :imageurl
      t.integer :enemy_id

      t.timestamps
    end
  end
end
