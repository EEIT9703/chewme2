/**
 * 
 */

var thsIssue;
var issueTemplate;
var commentBoxTemplate;
var viewCommentTemplate;
var newIssueTemplate;
var issuesDiv;
var userId;
function createForum(){

	console.log("append the new Issue Template")
	$("#forum-tab").one("click", initialForumPanel)
	userId = $('#userId_session').text();
}


function initialForumPanel() {
	issuesDiv.find('div[class="panel panel-default"]:first').attr("id",
			"newIssueDiv");
	$('#newIssueDiv').find("button").on("click", function() {
		sendIssue(this);
	})
	loadIssues();
}

function loadIssues() {
	$.getJSON("clubClientView.do?action=loadIssues", {
		"clubId" : $("#clubIdforView").text(),
		"now_list_no" : "",
		"number" : "",
		"prev_or_next" : "",
		"choose_date" : ""
	}, function(issues) {
		$.each(issues, function(i, issueVO) {
			// console.log(issueVO);
			insertIssue(issueVO);
			var memId = $('#userId').text();
			insertCommentBox();
			setAllImg();
		})
	});
	$("#forum-tab").off("click", loadIssues);
	$(".well").css("height", "15px");

	
	function setAllImg(){
		console.log("setImg");
		console.log($("#theForumDiv img"));
		var i;
		$.each($("#theForumDiv img"), function(i,target) {
			getMemberPicture(target);
		})	
	}
}
function getMemberPicture(target){
	var memId = target.id.substring(6);
	//console.log('memId'+memId);
	$.get('/CHEWME2/getImageInChewme.do', {
		"type" : "memPic",
		"id" : memId,
		queryMethod : "charQuery",
	}, function(data) {
		//console.log(data);
		var image_base64 = "data:image/png;base64,"+data
		$(target).attr("src",image_base64);
	})
}


function insertIssue(issueVO) {
	console.log(issueVO);
	__insertIssue(issueVO.issueId, issueVO.issueTitle, issueVO.issueContent,issueVO.proposerId);
	thsIssue = $("#issueId_" + issueVO.issueId);
	$.each(issueVO.comments, function(i, commentVO) {
		console.log(commentVO);
		var content = commentVO.getContent;
		insertViewComment(content,commentVO.getCommenterId);
	})
}
function __insertIssue(id,title,content,proposerId) {
	var issuesDiv = $("#theForumDiv");
	$('#newIssueDiv').after(issueTemplate);
	issuesDiv.find('div[class="panel panel-default"]:eq(1)').attr("id",
			"issueId_" + id).find(".panel-title").text(
					title).closest("#issueId_" + id).find(
			".well").text(content);
	issuesDiv.find('div[class="panel panel-default"]:eq(1)').find('img:first').attr("id","memId_"+proposerId)

	console.log(thsIssue);
}
function insertViewComment(content,commenterId) {
	console.log("build the viewCommentTemplate");
	thsIssue.find("ul").append(viewCommentTemplate);
	thsIssue.find("li:last")
	// .attr("id","issueId_"+commentVO.getIssueId+"commentId"+commentVO.getCommentId)
	.find(".well").text(content).attr("min-heigth", "20px");
	thsIssue.find("li:last").find('img').attr("id","memId_"+commenterId);
}
function insertCommentBox() {
	console.log("build the commentBoxTemplate");
	var userId = $('#userId_session').text();
	console.log($('#userId_session'));
	console.log("the userId is "+userId);
	console.log(thsIssue)
	thsIssue.find("ul").append(commentBoxTemplate);
	thsIssue.find("li:last").attr("id", "sendId" + thsIssue.issueId).find(
			"textarea").attr("name", "content");
	thsIssue.find("li:last").find('img').attr("id","memId_"+userId);
	thsIssue.find("button").on("click", function() {
		sendContent(this);
	})

}
function sendIssue(button) {
	console.log("send the issue");
	var content;
	var id;
	var sender;
	console.log(sender = $(button).closest('li[class="list-group-item"]'));
	console.log(content = $(button).closest("ul").find("textarea").val());
	console.log(title = $(button).closest(".panel").find(".panel-heading").find("input").val());
	/*console.log(proposerId);*/
	console.log(id =$("#clubIdforView").text());
	
	if ((content != "") && (title!="")) {
		$.post("clubClientView.do?action=insertIssue", {
			"content" : content,
			"title":title,
			"clubId": $("#clubIdforView").text(),
		}, function(data) {
			console.log("ajax回收資料完成");
			console.log(data=data.trim())
			id = data[0];
			
			$('#newIssueDiv').find("input").val("");
			$('#newIssueDiv').find("textarea").val("")			
			console.log("The userID !!!!!!"+userId);
			__insertIssue(id,title,content,userId);
			thsIssue = $("#issueId_" + id);
			
			console.log(thsIssue);
			console.log($("#issueId_1"));
			console.log($("#issueId_"+id));
			console.log("the id is "+id);
			insertCommentBox();
			$.each(thsIssue.find("img"), function(i,target) {
				console.log(target);
				getMemberPicture(target);
			})	
		});
	}
}

function sendContent(button) {
	console.log("send the content");
	var content;
	var id;
	var sender;
	console.log(sender = $(button).closest('li[class="list-group-item"]'));
	console.log(content = $(button).closest("ul").find("textarea").val());
	console.log(id = $(button).closest("div[class='panel panel-default']")
			.attr("id").substr(8));
	console.log(id);
	if (content != "") {
		$.post("clubClientView.do?action=insertComment", {
			"content" : content,
			"issueId" : id,

		}, function(data) {
			console.log("ajax回收資料完成");
			console.log(id)
			thsIssue = $("#issueId_" + id);
			sender.remove();
			insertViewComment(content,userId);
			console.log(thsIssue.find('img:last'));
			getMemberPicture(thsIssue.find('img:last')[0]);
			insertCommentBox();
			getMemberPicture(thsIssue.find('img:last')[0]);
			
		});
	}
}
function getTemplates() {
	$.get(reqContextPath + "/com-resource/_issueTemplate.jsp", {}, function(
			data) {
		issueTemplate = data;
		console.log(issueTemplate);
	})
	$.get(reqContextPath + "/com-resource/_viewCommentTemplate.jsp", {},
			function(data) {
				console.log(viewCommentTemplate = data);
			})
	$.get(reqContextPath + "/com-resource/_commentTemplate.jsp", {}, function(
			data) {
		console.log(commentBoxTemplate = data);
	})
	$.get(reqContextPath + "/com-resource/_newIssueTemplate.jsp", {}, function(
			data) {
		console.log(newIssueTemplate = data);
		issuesDiv = $("#theForumDiv");
		issuesDiv.prepend(newIssueTemplate);
	})
}
