class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :password_digest
      t.text :activity_area
      t.text :like_weapon
      t.string :image
      t.string :remember_digest

      t.timestamps
    end
  end
end
