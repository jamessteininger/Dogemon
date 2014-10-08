class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :imageurl
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end