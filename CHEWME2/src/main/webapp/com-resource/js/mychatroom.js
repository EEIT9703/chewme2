/**
 * 
 */
var thsUserName;
var thsSideMenu
var contextPath;
var sideMenuTemplate;
var chatRoomTemplate;
var chatSendTemplate;
var chatReceiveTemplate;
var thsChatRoom;
var friend_li = '<li class="active"><a href="#"><span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>'
	var spancontent ='<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span>';
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
		// console.log(thsChatRoom);
		// buildChatRoomTemplate($('#chat_window_1'));
		setWebSocket();
		console.log($('#btn-chat'));
	})
	thsUserName = $('tbody tr:eq(1) td').text().substr(3);
})
function buildSideMenu() {	
	$('body').append(sideMenuTemplate);
	thsSideMenu=$('nav-friendlist');
	console.log("start to load side menu");
	$.getJSON('/CHEWME2/buildSideMenu',{},function(datas){
		console.log("load side menu ok");		
		console.log(datas);
		$.each(datas,function(i,data){
			console.log(data.name);
			$('#bs-sidebar-navbar-collapse-1 ul').append(friend_li);
			$('#bs-sidebar-navbar-collapse-1 ul span:last').before(data.name);
			//var mydata = JSON.parse(data);
			
		})
	})
	
}

function buildChatRoomTemplate(t) {
	$(t).after(chatRoomTemplate);
	thsChatRoom = $('#chat_window_1');
	thsChatRoom.find('.msg_container_base').append(chatReceiveTemplate).append(
			chatSendTemplate);


}


// 設置WebSocket
function setWebSocket() {
	// 開始WebSocket連線
	webSocket = new WebSocket('ws://localhost:8080/CHEWME2/chatroom');
	// 以下開始偵測WebSocket的各種事件

	// onerror , 連線錯誤時觸發
	webSocket.onerror = function(event) {
		// loginBtn.disabled = false;
		// userNameInput.disabled = false;
		infoWindow.innerHTML = "登入失敗";
	};

	// onopen , 連線成功時觸發
	webSocket.onopen = function(event) {
		isConnectSuccess = true;

		// 送一個登入聊天室的訊息
		var firstLoginInfo = {
			userName : "系統",
			message : thsUserName + " 登入了聊天室"
		};
		webSocket.send(JSON.stringify(firstLoginInfo));
	};

	$('#btn-chat').on("click", function() {
		sendMessage();
		return false;
	});
	// 使用webSocket擁有的function, send(), 送出訊息
	function sendMessage() {
		// 檢查WebSocket連接狀態
		console.log('the send success');
		if (webSocket && isConnectSuccess) {
			var messageInfo = {
				userName : 1,
				target : 2,
				message : $('#btn-input').val()
			}
			webSocket.send(JSON.stringify(messageInfo));
		} else {
			infoWindow.innerHTML = "未登入";
		}
	}


	// onmessage , 接收到來自Server的訊息時觸發
	webSocket.onmessage = function(event) {
		var messageObject = JSON.parse(event.data);
		// messageDisplay.innerHTML += "" + messageObject.userName + " 說 : " +
		// messageObject.message;
	};
}

