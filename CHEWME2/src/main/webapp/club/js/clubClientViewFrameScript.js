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
		insertViewComment(commentVO);
	})
	
}
function insertViewComment(commentVO) {
	thsIssue.find("ul").append(viewCommentTemplate);
	thsIssue.find("li:last")
	.attr("id","issueId_"+commentVO.getIssueId+"commentId"+commentVO.getCommentId)
	.find(".well").text(commentVO.getContent);	
}
function insertCommentBox(issueVO){
	thsIssue.find("ul").append(commentBoxTemplate);	
	thsIssue.find("li:last")
	.attr("id","sendId"+issueVO.issueId).find("textarea").attr("name","content");	
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
