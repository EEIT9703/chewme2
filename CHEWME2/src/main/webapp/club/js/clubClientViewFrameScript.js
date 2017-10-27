var sel = $();
var issueTemplate;
var commentTemplate;
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
	}, function(data) {
		console.log(data.length);
		console.log(data);
		console.log(issueTemplate);
		$.each(data, function() {
			insertIssuePanel();
		})
	});

}

function insertIssuePanel() {
	$("#forum-page")
			.append(issueTemplate);	
}
function insertViewCommentTemplatePanel() {
}

function getTemplates(){
	$.get("_issueTemplate.jsp",{},function(data){
		console.log(issueTemplate=data);
	})
	$.get("_viewCommentTemplate.jsp",{},function(data){
		console.log(commentTemplate=data);
	})
	$.get("_commentTemplate.jsp",{},function(data){
		console.log(commentTemplate=data);
	})
}
