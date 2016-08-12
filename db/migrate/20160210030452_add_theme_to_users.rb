class AddThemeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :css_theme, :string
  end
end
