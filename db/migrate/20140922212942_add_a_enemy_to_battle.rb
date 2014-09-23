class AddAEnemyToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :aenemy_id, :integer
  end
end
