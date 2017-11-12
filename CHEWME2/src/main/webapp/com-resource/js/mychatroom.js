/**
 * 
 */

var contextPath;
var sideMenuTemplate;
var chatRoomTemplate;
var chatSendTemplate;
var chatReceiveTemplate;
var thsChatRoom;
$(document).ready(function() {
	contextPath = $('#requestContextPath').text();
	var fun1 = $.get(contextPath + '/com-resource/sideMenuTemplate.jsp', {})
	var fun2 = $.get(contextPath + '/com-resource/chatRoomTemplate.jsp', {})
	var fun3 = $.get(contextPath + '/com-resource/chatSendTemplate.jsp', {})
	var fun4 = $.get(contextPath + '/com-resource/chatReceiveTemplate.jsp', {})
	// 呼叫兩個以上版型的方法
	$.when(fun1, fun2, fun3, fun4).then(function(data1, data2, data3, data4) {
		
		sideMenuTemplate = data1[0];
		chatRoomTemplate = data2[0];
		chatSendTemplate = data3[0];
		chatReceiveTemplate = data4[0];
		buildSideMenu();
		buildChatRoomTemplate($('#nav-friendlist'));
		//console.log(thsChatRoom);		
		//buildChatRoomTemplate($('#chat_window_1'));
	})

})
function buildSideMenu() {
	console.log(sideMenuTemplate);
	console.log(chatRoomTemplate);
	$('body').append(sideMenuTemplate)
}

function buildChatRoomTemplate(t) {
	$(t).after(chatRoomTemplate);
	thsChatRoom = $('#chat_window_1');
	thsChatRoom.find('.msg_container_base').append(chatReceiveTemplate).append(chatSendTemplate);
	
}
