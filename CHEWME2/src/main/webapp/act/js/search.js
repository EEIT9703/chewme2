var template;
var template_attr;

$(document).ready(function() {


	function getTemp() {
		$.get("/CHEWME2/act/searchR.jsp", {}, function(data) {	
			template = data;	
		})
	}	
	function getTemp_attr() {
		$.get("/CHEWME2/act/searchR_attr.jsp", {}, function(data) {	
			//console.log(data);
			template_attr = data;	
		})
	}	
	
	$.when(getTemp()).then(getTemp_attr());	

	$('#search').click(function() {
		$('#div1').empty();
		var select1 = $("#select1").val();
		//console.log(select1);
		if(select1 == "行程"){
			
			var search = $("#text").val();			
			//console.log(search);		
			
	$.getJSON('/CHEWME2/act/ActivitySearch?action=Search', {'search' : search},	function(data) {
		var temp;
		console.log(data);
			$.each(data, function(i, datas) {
				//console.log(datas.act_photo);
				
				$('#div1').append(template);
				$(".center-block:last").attr("id","act_photo"+i);
				$(".url:last").attr({"href":'/CHEWME2/act/ActivitySearch?action=searchone&name='+datas.actID});
				//console.log($("#act_photo"+i));				
				$("#act_photo"+i).attr({"src":'data:image/png;base64,'+datas.act_photo});
				$(".act_name:last").attr("id","act_name"+i);
				$("#act_name"+i).text(datas.act_name);
				$(".id:last").attr({"id": datas.actID, "value": datas.actID});
				})
			})
			
			
		}else if(select1 == "景點"){			
			var name = $("#text").val();			
			$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(array){				
			
			$.each(array, function(j, data){
				//console.log(data.name);
				
				$('#div1').append(template_attr);
				$(".url_attr:last").attr({"href":'/CHEWME2/act/ActivitySearch?action=searchattr&name='+ data.attractionID})
				$(".act_name:last").attr("id","act_name"+j);
				$("#act_name"+j).text(data.name);	
				$(".id:last").attr({"id": data.attractionID, "value": data.attractionID});
				})			
			})
		}		
	})
	var select2 = $("#select1").val();
	//console.log(select2);	
//		$("img").click(function(){
//			console.log($(this))
//			var act = $(this).text();
//			var act1 = $(this).parent("a").next("input").val()
//			console.log(act1);		
//			$.get("/CHEWME2/act/ActivitySearch?action=searchone", {"name": act1}, function(){	
//				
//			})			
//		})
})