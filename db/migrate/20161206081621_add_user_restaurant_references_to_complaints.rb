class AddUserRestaurantReferencesToComplaints < ActiveRecord::Migration[5.0]
  def change
  	add_reference :complaints, :user, index: true
  	add_reference :complaints, :restaurant, index: true
  end
end
