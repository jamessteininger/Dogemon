class AddTownType < ActiveRecord::Migration
  def change
    add_column :towns, :gameplay_mechanic, :string
  end
end
