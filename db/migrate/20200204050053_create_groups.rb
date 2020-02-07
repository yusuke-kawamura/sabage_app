class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string  :name, null: false, unique: true
      t.text    :group_about
      t.timestamps
    end
  end
end
