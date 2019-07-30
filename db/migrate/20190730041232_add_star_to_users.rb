class AddStarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :star, :boolean
  end
end
