class AddElementToPet < ActiveRecord::Migration
  def change
    add_column :pets, :element, :string
  end
end
