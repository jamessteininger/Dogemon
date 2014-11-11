class AddAcceptTermToUser < ActiveRecord::Migration
  def change 
    add_column :users, :if_accepted_terms, :boolean
  end
end
