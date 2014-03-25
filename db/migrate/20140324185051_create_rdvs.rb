class CreateRdvs < ActiveRecord::Migration
  def change
    create_table :rdvs do |t|
    	t.integer :user_id
    	t.integer :time_slot_id
      t.timestamps
    end
  end
end
