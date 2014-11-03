class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :address
      t.integer :amount

      t.timestamps
    end
  end
end
