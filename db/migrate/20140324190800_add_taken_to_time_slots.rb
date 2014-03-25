class AddTakenToTimeSlots < ActiveRecord::Migration
  def change
  	add_column :time_slots, :taken, :tinyint, default: 0
  end
end
