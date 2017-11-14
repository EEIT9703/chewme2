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
				var state = datas.activity_state;
				console.log(state);
				if(state == 1){
					$('#div1').append(template);
					$(".center-block:last").attr("id","act_photo"+i);
					$(".url:last").attr({"href":'/CHEWME2/act/ActivitySearch?action=searchone&name='+datas.actID});
					//console.log($("#act_photo"+i));				
					$("#act_photo"+i).attr({"src":'data:image/png;base64,'+datas.act_photo});
					$(".act_name:last").attr("id","act_name"+i);
					$("#act_name"+i).text(datas.act_name);
					
					$(".act_price:last").attr("id","act_price"+i);				
					$("#act_price"+i).after(" 價格:"+datas.act_price+" 元");		
					
					$(".act_current:last").attr("id","act_current"+i);
					$("#act_current"+i).after(" 目前人數:"+datas.act_current+" 人");
					
					$(".id:last").attr({"id": datas.actID, "value": datas.actID});
				}
				
				})
			})
			$.each($('.activityTemplate'),function(i,atemplate ){
			if(i%3==0){
				atemplate.after('<div class="clearfix visible-md visible-sm"></div>');
			}
			
		})
			
		}else if(select1 == "景點"){			
			var name = $("#text").val();			
			$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(array){				
			
			$.each(array, function(j, data){
				//console.log(data.name);
				//console.log(data.intro.substring(0, 10) + "....");
				
				$('#div1').append(template_attr);
				$(".btn.btn-info.btn-sm:last").attr({"href":'/CHEWME2/act/ActivitySearch?action=searchattr&name='+ data.attractionID})
				$(".act_name:last").attr("id","act_name"+j);
				$("#act_name"+j).text(data.name);	
				$(".searchhasimage:last").attr({"src": "/CHEWME2/getImage.do?id="+ data.name +"&type=uploadimg"});
				$(".id:last").attr({"id": data.attractionID, "value": data.attractionID});
				$(".intro1:last").attr("id", "intro1"+j);
				$("#intro1"+j).text(data.intro.substring(0, 150) + ".....");
				$("#intro1"+j).append("<a>(繼續閱讀)</a>");
				})			
			})
			
		}		
	})
})