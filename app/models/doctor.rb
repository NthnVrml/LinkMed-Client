class Doctor < ActiveRecord::Base

  has_many :rdvs, through: :time_slots, inverse_of: :doctor
	has_many :time_slots, inverse_of: :doctor, dependent: :destroy

	def free_time_slots
		time_slots.where(taken: 0)
	end
end
