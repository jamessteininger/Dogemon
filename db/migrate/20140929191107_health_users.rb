class HealthUsers < ActiveRecord::Migration
  def change
    add_column :users, :health, :integer
    add_column :users, :total_health, :integer
    add_column :users, :magic, :integer
    add_column :users, :attack, :integer
  end
end
