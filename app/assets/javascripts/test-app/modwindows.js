$(document).ready(function(){
	
	$(document).on('click', 'a.linkmodal, a.question, a.button.markup, .modalwin .add', function(e){
		$('body').append('<div id="overlay"></div>');
		$('#overlay').fadeTo('fast',0.5);
		$(this).parents('.modalwin').children('.modal').show('fast');
		$(this).addClass('on');
		e.preventDefault()
	});
	
	$(document).on('click', '.modalwin a.x, .modalwin a.x1, .modalwin a.closex', function(e){
		$('#overlay').fadeTo('fast',0, function() {
			$('#overlay').remove();
		});
		node = $(this).parents('.modalwin')
		$(node).children('.modal').hide('fast');
		$(node).children('.linkmodal').removeClass('on');
		e.preventDefault()
	});
});
