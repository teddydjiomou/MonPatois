function load_dictionary(language_name, letter, page)
    {    	
    	jQuery.ajax({ 
		        	url: 'load_dictionary', 
		        	type: 'GET', 
		        	data: { 'language' : language_name, 
		        			'letter' : letter,
		        			'page' : page},
		        	dataType: 'html',
		        	success: function(data) { $('#dictionary').html(data); },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	//event.preventDefault(); // Prevent link from following its href
    	//alert('JQuery OK!');
  };
   
function load_expressions(language_name, page)
    {    	    	
    	jQuery.ajax({ 
		        	url: 'load_expressions', 
		        	type: 'GET', 
		        	data: { 'language' : language_name, 'page' : page },
		        	dataType: 'html',
		        	success: function(data) { $('#expressions').html(data); },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	//event.preventDefault(); // Prevent link from following its href
    	//alert('JQuery OK!');
  };

function load_discussions(language_name, page)
    {    	    	
    	jQuery.ajax({ 
		        	url: 'load_discussions', 
		        	type: 'GET', 
		        	data: { 'language' : language_name, 'page' : page },
		        	dataType: 'html',
		        	success: function(data) { $('#discussions').html(data); },
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
		        	success: function(data) { 
		        		if (data){ alert(data);}
		        		else{ window.location.reload(true); }
		        		  },
		        	beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},		    				
    				});
    	//event.preventDefault(); // Prevent link from following its href
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

        