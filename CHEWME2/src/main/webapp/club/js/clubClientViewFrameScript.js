var sel = $();
var issueTemplate;
var commentBoxTemplate;
var viewCommentTemplate;

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
			
		})
	});

}

function insertIssue(issueVO) {
	var forum_page = $("#forum-page");
	forum_page.append(issueTemplate);
	forum_page.find("div:last-child").attr("id","issueId_"+issueVO.issueId)
					.find(".panel-title").text(issueVO.issueTitle)
					.closest("#"+issueVO.issueId).find(".well").text(issueVO.issueContent);
	var issue_page =$("#"+issueVO.issueId);
	$.each(issueVO.comments, function(i,commentVO){
		insertViewComment(commentVO);
	})
	
}
function insertViewComment(commentVO) {
	var issue_page =$("#"+commentVO.getcommentId);
	issue_page.after(viewCommentTemplate);
	issue_page.next()
	.attr("id","issueId_"+commentVO.getIssueId+"commentId"+commentVO.getCommentId)
	.find(".well").text(commentVO.content);
	;
	
	
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
