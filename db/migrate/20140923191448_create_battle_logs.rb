class CreateBattleLogs < ActiveRecord::Migration
  def change
    create_table :battle_logs do |t|
      t.string :description
      t.string :type
      t.integer :battle_id

      t.timestamps
    end
  end
end
