var sel = $();
var issueTemplate;
var commentBoxTemplate;
var viewCommentTemplate;
var thsIssue;

$(document).ready(function() {
	
	getTemplates();
	
	initialForumPanel();
	
})

function loadIssues() {
	$.getJSON("clubClientView.do?action=loadIssues", {
		"clubId" : 1,
		"now_list_no" : "",
		"number" : "",
		"prev_or_next" : "",
		"choose_date" : ""
	}, function(issues) {
		$.each(issues, function(i, issueVO) {
			//console.log(issueVO);
			insertIssue(issueVO);
			insertCommentBox(issueVO);
		})
	});
	$("#forum-tab").off("click", loadIssues);
	$(".well").css("height", "15px");
}
function initialForumPanel(){
	var theIssues = $("#theForumDiv");
	theIssues.prepend(issueTemplate);
	loadIssues();
}
function insertIssue(issueVO) {
	var issuesDiv = $("#theForumDiv");
	issuesDiv.append(issueTemplate);
	issuesDiv.find('div[class="panel panel-default"]:last').attr("id",
			"issueId_" + issueVO.issueId).find(".panel-title").text(
			issueVO.issueTitle).closest("#issueId_" + issueVO.issueId).find(
			".well").text(issueVO.issueContent);
	thsIssue = $("#issueId_" + issueVO.issueId);
	console.log(thsIssue);
	$.each(issueVO.comments, function(i, commentVO) {
		var content = commentVO.getContent;
		insertViewComment(content);
	})

}
function insertViewComment(content) {
	console.log("build the viewCommentTemplate");
	thsIssue.find("ul").append(viewCommentTemplate);
	thsIssue.find("li:last")
	// .attr("id","issueId_"+commentVO.getIssueId+"commentId"+commentVO.getCommentId)
	.find(".well").text(content).attr("min-heigth", "20px");
}
function insertCommentBox() {
	console.log("build the commentBoxTemplate");
	thsIssue.find("ul").append(commentBoxTemplate);
	thsIssue.find("li:last").attr("id", "sendId" + thsIssue.issueId).find(
			"textarea").attr("name", "content");
	thsIssue.find("button").on("click", function() {
		sendContent(this)
	})

}
function sendContent(button) {
	var content;
	var id;
	var sender;
	console.log(sender = $(button).closest('li[class="list-group-item"]'));
	console.log(content = $(button).closest("ul").find("textarea").val());
	console.log(id = $(button).closest("div[class='panel panel-default']")
			.attr("id").substr(8));
	$.post("clubClientView.do?action=insertComment", {
		"content" : content,
		"issueId" : id
	}, function() {
		console.log("ajax回收資料完成");
		console.log(id)
		thsIssue = $("#issueId_" + id);
		sender.remove();
		insertViewComment(content);
		insertCommentBox();
	});
}
function getTemplates() {
	$.get("/CHEWME2/com-resource/_issueTemplate.jsp", {}, function(data) {
		console.log(issueTemplate = data);
	})
	$.get("/CHEWME2/com-resource/_viewCommentTemplate.jsp", {}, function(data) {
		console.log(viewCommentTemplate = data);
	})
	$.get("/CHEWME2/com-resource/_commentTemplate.jsp", {}, function(data) {
		console.log(commentBoxTemplate = data);
	})
	
	
}
