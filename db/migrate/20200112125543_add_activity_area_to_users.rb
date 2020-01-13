class AddActivityAreaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Activity_area, :text
  end
end
