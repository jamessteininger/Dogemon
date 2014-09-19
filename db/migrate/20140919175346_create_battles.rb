class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :user_id
      t.integer :enemy_id

      t.timestamps
    end
  end
end
