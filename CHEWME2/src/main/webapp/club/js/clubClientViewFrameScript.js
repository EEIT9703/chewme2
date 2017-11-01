var sel = $();
var issueTemplate;
var commentBoxTemplate;
var viewCommentTemplate;
var thsIssue;

$(document).ready(function() {
	$("#tabs").tabs();
	getTemplates();
	$("#forum-tab").on("click", loadIssues)

})
function loadIssues() {
	$.getJSON("clubClientView.do?action=loadIssues", {
		"clubId" : $("#clubIdforView").text(),		
		"now_list_no" : "",
		"number" : "",
		"prev_or_next" : "",
		"choose_date" : ""
	}, function(issues) {
		$.each(issues, function(i,issueVO) {
			insertIssue(issueVO);
			insertCommentBox(issueVO);
		})
	});
	$("#forum-tab").off("click",loadIssues);
	$(".well").css("height", "15px");
}

function insertIssue(issueVO) {
	var forum_page = $("#forum-page");
	forum_page.append(issueTemplate);
	forum_page.find('div[class="panel panel-default"]:last').attr("id","issueId_"+issueVO.issueId)
					.find(".panel-title").text(issueVO.issueTitle)
					.closest("#issueId_"+issueVO.issueId).find(".well").text(issueVO.issueContent);
	thsIssue =$("#issueId_"+issueVO.issueId);
	console.log(thsIssue);
	$.each(issueVO.comments, function(i,commentVO){
		var content = commentVO.getContent;
		insertViewComment(content);
	})
	
}
function insertViewComment(content) {
	console.log("build the viewCommentTemplate");
	thsIssue.find("ul").append(viewCommentTemplate);
	thsIssue.find("li:last")
	//.attr("id","issueId_"+commentVO.getIssueId+"commentId"+commentVO.getCommentId)
	.find(".well").text(content).attr("min-heigth","20px");	
}
function insertCommentBox(){
	console.log("build the commentBoxTemplate");
	thsIssue.find("ul").append(commentBoxTemplate);	
	thsIssue.find("li:last")
	.attr("id","sendId"+thsIssue.issueId).find("textarea").attr("name","content");
	thsIssue.find("button").on("click",function(){sendContent(this)})
	
}
function sendContent(button){
	var content;
	var id;
	var sender;
	console.log(sender=$(button).closest('li[class="list-group-item"]'));
	console.log(content=$(button).closest("ul").find("textarea").val());
	console.log(id=$(button).closest("div[class='panel panel-default']").attr("id").substr(8));
	$.post("clubClientView.do?action=insertComment", {
		"content":content ,	
		"issueId": id
	}, function() {
		console.log("ajax回收資料完成");
		console.log(id)
		thsIssue=$("#issueId_"+id);
		sender.remove();
		insertViewComment(content);
		insertCommentBox();
	});
}
function getTemplates(){
	$.get("_issueTemplate.jsp",{},function(data){
		console.log(issueTemplate=data);
	})
	$.get("_viewCommentTemplate.jsp",{},function(data){
		console.log(viewCommentTemplate=data);
	})
	$.get("_commentTemplate.jsp",{},function(data){
		console.log(commentBoxTemplate=data);
	})
}
