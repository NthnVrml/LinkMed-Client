# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#add-field').click ->
		$('#user_fields').append "<div class='row user_field'>
			<div class='col-md-4'>
				<input class='field-name' type='text' name='fields[name][]' placeholder='Nom du champ'/>
			</div>
			<div class='col-md-8'>
				<textarea placeholder='Détails' class='field-text' type='text' name='fields[text][]'></textarea>
			</div>
		</div>"
