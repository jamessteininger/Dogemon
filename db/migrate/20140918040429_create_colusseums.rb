class CreateColusseums < ActiveRecord::Migration
  def change
    create_table :colusseums do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
