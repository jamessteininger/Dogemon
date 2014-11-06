class AddUtilityTypeToBattle < ActiveRecord::Migration
  def change
    add_column :ghost_logs, :utility_type, :string
  end
end
