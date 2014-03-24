class TimeSlot < ActiveRecord::Base

  belongs_to :doctor, inverse_of: :time_slots
  has_one :rdv, inverse_of: :time_slot
end
