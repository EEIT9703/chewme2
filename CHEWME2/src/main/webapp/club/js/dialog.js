/**
 * 
 */
  var dialog;
  $( function() {

    //創造一個dialog 但是自動顯是為關
    dialog = $( "#dialog-img" ).dialog({
    	autoOpen: false,    	
    });

    //當input按下去的話 自動產生ialog
    $( "#uploadImage" ).button().on( "click", function() {
    	console.log("the dialog")
      dialog.dialog( "open" );
    });
    imgOnload($('#img'));
    $('#confirmImg').on("click",function(){
    	$('#img123').imgAreaSelect({remove:true});
    	dialog.dialog("close");
    	imgAreaInit($('#img123'));
    	inputChangeEventListener($("#uploadImage"));
    	imgAreaSelectAndReadEventListener($('#img123'));
    	imgOnload($('#img123'));
    })
    
  });

  
  
  // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
//emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
//name = $( "#name" ),
//email = $( "#email" ),
//password = $( "#password" ),
//allFields = $( [] ).add( name ).add( email ).add( password ),
//tips = $( ".validateTips" );