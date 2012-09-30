/* ----------------------------
- Copyright 2012, Ideaware.com All rights reserved.
- Authors: Maria Helena Barros Burchardt    
- Version: 1.0 
*/

$(document).ready(function(){
	if($.fn.placeholder) $('form').placeholder();
	if($.fn.uniform) $("input:checkbox, select, input:file, input:radio").uniform();
});
