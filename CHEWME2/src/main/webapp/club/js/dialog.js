/**
 * 
 */

  $( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
    dialog = $( "#dialog-img" ).dialog({
    	autoOpen: false,
    	
    }
    		);

    $( "#uploadImage" ).button().on( "click", function() {
    	console.log("the dialog")
      dialog.dialog( "open" );
    });
    $('#img')[0].onload = function(){
    	console.log("show img width");
        $('#dialog-img').width($(this).width());
        dialog.dialog({"width":$(this).width()+20});   
    };
    $('#confirmImg').on("click",function(){
    	dialog.dialog("close");
    })
    
  });