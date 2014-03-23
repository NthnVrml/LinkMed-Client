# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

regions =
	'Nord-Pas-de-Calais': 'FR-O'
	'Picardie': 'FR-S'
	'Haute-Normandie': 'FR-Q'
	'Basse-Normandie': 'FR-P'
	'Bretagne': 'FR-E'
	'Pays de la Loire': 'FR-R'
	'Centre': 'FR-F'
	'Île-de-France': 'FR-J'
	'Bourgogne': 'FR-D'
	'Champagne-Ardenne': 'FR-G'
	'Lorraine': 'FR-M'
	'Alsace': 'FR-A'
	'Franche-Comt': 'FR-I'
	'Rhne-Alpes': 'FR-V'
	'Auvergne': 'FR-C'
	'Limousin': 'FR-L'
	'Poitou-Charentes': 'FR-T'
	'Aquitaine': 'FR-B'
	'Midi-Pyrnes': 'FR-N'
	'Languedoc-Roussillon': 'FR-K'
	'Provence-Alpes-Côte-d\'Azur': 'FR-U'
	'Corse': 'FR-H'
	'French Guiana': 'FR-GF'

$ ->
	window.array = []
	map = new jvm.WorldMap
		container: $('#map')
		map: 'fr_merc_en'
		backgroundColor: '#a3bfd5'
		regionStyle:
			initial: fill: '#79a6c4', stroke: 'white', 'stroke-width': 2
			selected: fill: '#edc350'
		regionsSelectable: true
		regionsSelectableOne: true
		onRegionSelected: (e, region) ->
			return unless map
			array.push "'#{map.getRegionName region}' => '#{region}',"
			$('#selected-region-text').text map.getRegionName region
			$('#selected-region-input').val map.getRegionName region
		selectedRegions: regions[$('#selected-region-input').val()]