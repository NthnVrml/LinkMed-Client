class PagesController < ApplicationController

	REGIONS = {
		"Île-de-France" => ["75", "77", "78", "91", "92", "93", "94", "95"],
		"Corse" => ["20"]
	}

	def home
		@titre = "Accueil"
		if params[:speciality]
			region = REGIONS[params[:region]]
			@doctors = Doctor.where("speciality LIKE ? AND SUBSTR(postal_code, 1, 2) IN (?)", "#{params[:speciality]}%", region)
		else
			@doctors = []
		end
	end

	def about
		@titre = "A propos de nous"
	end

	def contact	
		@titre = "Contact"
	end
end
