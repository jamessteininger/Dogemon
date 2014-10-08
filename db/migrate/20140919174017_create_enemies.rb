class CreateEnemies < ActiveRecord::Migration

  def change
    create_table :enemies do |t|
      t.integer :health
      t.integer :attack
      t.integer :defense
      t.string :element
      t.integer :coin
      t.integer :experience
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
