class InitialSchema < ActiveRecord::Migration[5.0]
  def change

    create_table :restaurants do |t|
      t.string  :name
      t.text    :description
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :phone
    end

    create_table :reviews do |t|
      t.text    :comment
      t.integer :rating
    end

    create_table :categories do |t|
      t.string  :name
    end
  end
end
