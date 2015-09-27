function load_dictionary(language_id, letter)
    {    	
    	jQuery.ajax({ 
		        	url: 'load_dictionary', 
		        	type: 'GET', 
		        	data: { 'language' : language_id, 
		        			'letter' : letter },
		        	dataType: 'html',
		        	success: function(data) { $('#dictionary').html(data); },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	//event.preventDefault(); // Prevent link from following its href
    	//alert('JQuery OK!');
  };
   
function load_expressions(language_id)
    {    	    	
    	jQuery.ajax({ 
		        	url: 'load_expressions', 
		        	type: 'GET', 
		        	data: { 'language' : language_id, },
		        	dataType: 'html',
		        	success: function(data) { $('#expressions').html(data); },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	//event.preventDefault(); // Prevent link from following its href
    	//alert('JQuery OK!');
  };

function vote(translation, expression, state)
    {    	
    	jQuery.ajax({ 
		        	url: 'vote', 
		        	type: 'POST', 
		        	data: { 'translation' : translation, 
		        		    'expression' : expression,
		        			'state' : state },
		        	dataType: 'html',
		        	//success: function(data) { $('#dictionary').html(data); },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	event.preventDefault(); // Prevent link from following its href
    	//alert('JQuery OK!');
  };
  
var vertical = new marquee("marqueever").vertical({
		step:1, //how many pixels to move per interval (default: 1)
        interval: 40, //how often to move pixels in miliseconds (default: 10)
        stop_on_hover: true, //should marquee stop on mouse hover (default: true)
        backwards: false //rotate elements in opposite direction
        //separator: "<img src="./sep.png" height="9px" width="9px" border="0"/>" 
        //separator to insert between html nodes (default: "")
        });
        
$( "#login_button" ).click(function() {
  alert( "Handler for .click() called." );
});