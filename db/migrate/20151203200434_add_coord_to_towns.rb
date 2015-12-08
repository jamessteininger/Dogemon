class AddCoordToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :x_coordinate, :integer
    add_column :towns, :y_coordinate, :integer
  end
end
