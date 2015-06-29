class AddBattleAnimationAndArt < ActiveRecord::Migration
  def change
    add_column :pets, :animation_name, :string
    add_column :battles, :background_url, :string
    add_column :towns, :north_id, :integer
    add_column :towns, :south_id, :integer
    add_column :towns, :west_id, :integer
    add_column :towns, :east_id, :integer
    add_column :towns, :background_url, :string
    add_column :items, :animation_name, :string
    add_column :items, :sound_file_id, :integer
    add_column :pets, :sound_file_id, :integer
    add_column :battles, :sound_file_id, :integer
    add_column :towns, :sound_file_id, :integer
    add_column :users, :b_sound_on, :booleans
    add_column :items, :influence_amount, :float
  end
end
