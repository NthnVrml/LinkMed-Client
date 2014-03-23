class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
    	t.integer :doctor_id
    	t.integer :start
    	t.integer :end
      t.timestamps
    end
  end
end
