class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string  :name, null: false, unique: true
      t.text    :description
      t.references :group_creator, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
