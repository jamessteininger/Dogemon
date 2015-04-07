class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.integer :user_id
      t.integer :pet_id
      t.integer :ghost_id
      t.integer :number_of_bounties
      t.float :amount

      t.timestamps
    end
  end
end
