class AddUserIdToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :user_id, :integer
  end
end
