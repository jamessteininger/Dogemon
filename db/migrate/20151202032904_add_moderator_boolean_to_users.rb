class AddModeratorBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :b_mod, :boolean
  end
end
