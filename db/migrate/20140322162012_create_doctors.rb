class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
    	t.string :name
    	t.string :speciality
    	t.string :address
    	t.string :postal_code
    	t.string :city
      t.timestamps
    end
  end
end
