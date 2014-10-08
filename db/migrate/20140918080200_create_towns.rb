class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :image_url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
