class AddSalesFreebieBoolean < ActiveRecord::Migration
  def change
    add_column :sales, :b_free, :boolean
  end
end
