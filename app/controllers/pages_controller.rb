class PagesController < ApplicationController

	REGIONS = {
		"Île-de-France" => ["75", "77", "78", "91", "92", "93", "94", "95"],
		"Corse" => ["20"],
		"Nord-Pas-de-Calais" => ["59", "62"],
		"Alsace" => ["67", "68"],
		"Aquitaine" => ["24", "33", "40", "47", "64"],
		"Auvergne" => ["03", "15", "43", "63"],
		"Basse-Normandie" => ["14", "50", "61"],
		"Bourgogne" => ["21", "58", "71", "89"],
		"Bretagne" => ["22", "29", "35", "56"],
		"Centre" => ["18", "28", "36", "37", "41", "45"],
		"Champagne-Ardenne" => ["08", "10", "51", "52"],
		"Franche-Compté" => ["25", "39", "70", "90"],
		"Haute-Normandie" => ["27", "76"],
		"Languedoc-Roussillon" => ["11", "30", "34", "48", "66"],
		"Limousin" => ["19", "23", "87"],
		"Lorraine" => ["54", "55", "57", "88"],
		"Midi-Pyrénées" => ["09", "12", "31", "32", "46", "65", "81", "82"],
		"Pays de la Loire" => ["44", "49", "53", "72", "85"],
		"Picardie" => ["02", "60", "80"],
		"Poitou-Charentes" => ["16", "17", "79", "86"],
		"Provence-Aples-Côte-d'Azur" => ["04", "05", "06", "13", "83", "84"],
		"Rhône-Alpes" => ["01", "07", "26", "38", "42", "69", "73", "74"]
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
