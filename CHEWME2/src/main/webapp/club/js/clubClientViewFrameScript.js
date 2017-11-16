var sel = $();
var reqContextPath;
var dataURL;

$(document).ready(function() {
	reqContextPath = $('#reqContextPath').text();
	console.log($('.manage_input'));
	$("#tabs").tabs();
	$("#briefdiv").hide();
	getTemplates();
	createForum();
	setClubImg();
	changePicSet();
	joinClubEventListner();
	changeManagerEventListener();
	changeBriefChangeListener();

})

function joinClubEventListner() {
	$('#joinClub').on("click", function() {
		$.post(reqContextPath + '/club/clubClientView.do', {
			action : "joinClub",
			clubId : $('#clubIdforView').text(),
		}, function(data) {
			window.alert("加入社團成功");
			$('#joinClub').hide();
			$('#joinClub').prop('disabled','disabled');
			$('#hello p').text('歡迎加入社員');
			$('#clubMemberTable tbody').append('<tr><td>'+$("#userId_session").text()+'</td><td>'+$("#userName_session").text()+'</td><td>'+$("#userNickN_session").text()+'</td><td>'+$("#userBirth_session").text()+'</td><td>'+$("#userInterest_session").text()+'</td><td>'+$("#userMmail_session").text()+'</td><tr>');
			
		})
	});
}

function changeBriefChangeListener(){
	$('#briefbutton').on("click",function(){
		$("#briefdiv").show();
		 console.log($("#brieftextarea").val());
		 console.log($("#briefpanel p").text());
		var newbrief = $("#brieftextarea").val();
		
		$("#briefpanel p").text(newbrief);
		renewClubInfo();
	});
}

function changeManagerEventListener() {
	$("#clientCCV").parent().hide();
	$('#clubInfo button').parent().hide();
	$('#confirmImg').on("click", function() {
		$.post(reqContextPath + '/club/clubClientView.do', {
			action : "updatePic",
			photo : dataURL,
			clubId : $('#clubIdforView').text(),
		}, function() {

		})
	})
	$('#manageCCV').on("click", function() {
		manageCCV();
	})
	$('#clientCCV').on("click", function() {
		clientCCV();
	})

	$('#reNew').on("click", function() {
		console.log(image);
		$("#carouselExampleControls img:first").attr("src", dataURL);
		console.log($('#clubIdforView').text());
		$.each($('.manage_input'), function(i, target) {
			var temp = $(target).find('input').val();
			$(target).text(temp);
		})
		renewClubInfo();
	})
}
function renewClubInfo(){
	$.post(reqContextPath + '/club/clubClientView.do', {
		
		action : "updateClubInfo",
		clubId : $('#clubIdforView').text(),
		clubName : $('#club_name').text(),
		addr : $('#club_addr').text(),
		cityId : $('#club_loc').text(),
		refUrl : $('#club_refurl').text(),
		brief : $('#briefpanel p').text()
	}, function(data) {
		console.log("ok");
	})
}



function setClubImg() {
	var thsImg;
	$.each($("#carouselExampleControls img"), function() {
		console.log(this.id.substring(4));
		thsImg = this;
		$.get(reqContextPath + '/getImageInChewme.do', {
			"type" : "clubPic",
			"id" : this.id.substring(4)
		}, function(data) {
			// console.log(data);
			console.log(this);
			$(thsImg).attr("src", data);

		})
	})
}

function changePicSet() {
	// 選擇我們要的canvas
	mycanvas = $("#myCanvas");
	ctx = mycanvas[0].getContext("2d");
	// 生成一個image空間來儲存我們要的空間
	image = new Image();
	// 創造一個圖形區域選擇器
	imgAreaInit($('#img'));
	inputChangeEventListener($("#uploadImage"));
	imgAreaSelectAndReadEventListener($('#img'));
}

function clientCCV() {
	$('.manage button').prop("disabled", true).parent().hide();
	$("#clientCCV").parent().hide()
	$("#manageCCV").parent().show();
	$("#briefdiv").hide();
}

function manageCCV() {
	console.log("manageCCV")

	// $('.manage').css("display","block");
	// console.log($('.manage button'));
	$('.manage div').show();
	$('.manage button').removeAttr("disabled");
	console.log($('.manage_input'));
	$.each($('.manage-btn'), function(i, btn) {
		set_btnevent1(this);
	})
	$("#clientCCV").parent().show()
	$("#manageCCV").parent().hide();
	$("#briefdiv").show();

}
function changeContent(btn) {
	var td = $(btn).parent().parent().siblings('.manage_input');
	console.log($(td))

	var temp = td.text();
	// var tdwidth = td.width();
	var input = "<input id='mi_" + $(td).attr("id") + "' value='" + temp
			+ "'></input>"
	// console.log(input);
	td.text("");
	td.append(input);
	td.find("input");// .width(tdwidth-3);

	$(td).find('input').on("keypress", function(e) {
		code = (e.keyCode ? e.keyCode : e.which);
		if (code == 13) {
			var temp = this.value;
			$(this).parent().text(temp);
			set_btnevent1(btn);
		}
	})

}
function set_btnevent1(btn) {
	$(btn).on("click", function() {
		changeContent(this);
		$(this).off("click");
		set_btnevent2(this);
	});
}
function set_btnevent2(btn) {
	$(btn).on(
			"click",
			function(e) {
				var input = $(this).parent().parent().siblings('.manage_input')
						.find("input");
				console.log("show input");
				console.log(input);
				console.log(input.val());
				var temp = input.val();
				input.off("keypress");
				input.parent().text(temp);
				set_btnevent1(btn);
			})
}
