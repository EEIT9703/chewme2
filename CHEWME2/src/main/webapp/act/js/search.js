var template;

$(document).ready(function() {

	function getTemp() {
		$.get("/CHEWME2/act/searchR.jsp", {}, function(data) {		
			template = data;				

		})		

		
		
	}	
	
	$("h3").click(function(){
		var act = $(this).text();
		console.log(act);
		window.location = "/CHEWME2/act/showAct.jsp?actID=?";
	})
	
	$.when(getTemp());
	
		

	$('#search').click(function() {
		$('#div1').empty();
		var select1 = $("#select1").val();
		console.log(select1);
		if(select1 == "行程"){
			
			var search = $("#text").val();			
			console.log(search);		
			
	$.getJSON('/CHEWME2/act/ActivitySearch?action=Search', {'search' : search},	function(data) {
		var temp;
		console.log(data);
			$.each(data, function(i, datas) {
				//console.log(datas.act_photo);
				$('#div1').append(template);
				$(".img-responsive:last").attr("id","act_photo"+i);
				console.log($("#act_photo"+i));				
				$("#act_photo").attr({"src":'data:image/png;base64,'+datas.act_photo,'id':'act_photo'+i});
				$(".act_name:last").attr("id","act_name"+i);
				$("#act_name"+i).text(datas.act_name);
				$(".id:last").attr("id", datas.actID);
				})
				
			

			})
			
			
		}else if(select1 == "景點"){			
			var name = $("#text").val();			
			$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(array){				
			
			$.each(array, function(j, data){
				//console.log(data.name);
				
				$('#div1').append(template);
//				$(".target:last").attr("id","content_"+i);
				$(".act_name:last").attr("id","act_name"+j);
				$("#act_name"+j).text(data.name);	
				$(".id:last").attr("id", data.attractionID);
				})			
			})
		}
		
	})

	$("img").click(function(){
		
		var act = $(this).text();
		var act1 = $(this).next("input").val()
		console.log(act1);		
		$.get("/CHEWME2/act/ActivitySearch?action=searchone", {"name": act1}, function(){
			
		})
	})
	
})