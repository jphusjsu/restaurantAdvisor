class AddHideDisplayToRestaurants < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :hidden, :boolean, default: true
  end
end
