class CreateSupportComplaintTables < ActiveRecord::Migration[5.0]
  def change
    create_table :supports do |t|
    	t.string :name
    	t.string :body
    end

    create_table :complaints do |t|
    	t.string :body
    end

  end
end
