var cell1;
var template;

$(function(){	
	$.when(getTemp()).then(loadempty);
})
function getTemp(){
	$.get("cube.jsp", {}, function(data){
		template = data;
		//console.log(template);		
	})
}
$("#button1").click(function(){
	
	
	loadempty();
	var name = $("#tags").val();
	var opt = $("#div1");
	$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(array){				
		
		$.each(array, function(i, data){
			console.log(data.name);
			opt.append(template);
			$(".target:last").attr("id","content_"+i);
			$("#content_"+i).text(data.name);
			
		})
		
		
	})
})	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		$.each(array,function(i, data){
//			var cell1 = $("<div></div>").addClass("col-sm-6 col-md-4");
//			var cell2 =$("<div></div>").addClass("thumbnail");
//			var cell3 =$("<div></div>").addClass("caption");
//			var cell4 =$("<h3></h3>").text(data.name);
//			var cell5 =$("<p></p>")
//			var cell6=$("<a></a>").attr("role","button").addClass("btn btn-default").attr("href","#").html("Button");
//			cell5.append(cell6);
//			cell3.append(cell4);
//			cell3.append(cell5);
//			cell2.append(cell3);
//			cell1.append(cell2);
//			opt.append(cell1);
//		})				
	

$("#div1").on("click","p>a:nth-child(1)",function(){
	console.log($(this).html())
})

function loadempty(){
	var opt = $("#div1");
	opt.empty();
}
