class AddLikeWeaponToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like_weapon, :text
  end
end
