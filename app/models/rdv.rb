class Rdv < ActiveRecord::Base
	belongs_to :user, inverse_of: :rdvs
	belongs_to :time_slot, inverse_of: :rdv, dependent: :destroy
	has_one :doctor, through: :time_slot, inverse_of: :rdvs
end
