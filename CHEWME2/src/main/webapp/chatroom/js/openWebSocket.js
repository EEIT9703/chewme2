/**
 * 
 */
	var thsUserName;
    //設置登入鈕的動作，沒有登出，登入才可發言
    $(document).ready(function() {
        //檢查有無輸入名稱
    	thsUserName = $('tbody tr:eq(1) td').text().substr(3);
    	setWebSocket();  //設置WebSocket連接
//        if (userNameInput.value && userNameInput.value !== "") {
//        } else {
//            infoWindow.innerHTML = "請輸入名稱";
//        }
    	console.log( $('#btn-chat'));
    });
    
    //設置WebSocket
    function setWebSocket() {
        //開始WebSocket連線
        webSocket = new WebSocket('ws://localhost:8080/CHEWME2/chatroom');
        //以下開始偵測WebSocket的各種事件
         
        //onerror , 連線錯誤時觸發  
        webSocket.onerror = function (event) {
            //loginBtn.disabled = false;
            //userNameInput.disabled = false;
            infoWindow.innerHTML = "登入失敗";
        };
 
        //onopen , 連線成功時觸發
        webSocket.onopen = function (event) {
            isConnectSuccess = true;
            //loginBtn.disabled = true;
            //userNameInput.disabled = true;
            //infoWindow.innerHTML = "登入成功";
             
            //送一個登入聊天室的訊息
            var firstLoginInfo = {
                userName : "系統",
                message : thsUserName + " 登入了聊天室"
            };
            webSocket.send(JSON.stringify(firstLoginInfo));
        };
        
        $('#btn-chat').on("click", function () {
            sendMessage();
            return false;
        });
 
        //onmessage , 接收到來自Server的訊息時觸發
        webSocket.onmessage = function (event) {
            var messageObject = JSON.parse(event.data);
            //messageDisplay.innerHTML += "" + messageObject.userName + " 說 : " + messageObject.message;
        };
    }

    //使用webSocket擁有的function, send(), 送出訊息
    function sendMessage() {
       //檢查WebSocket連接狀態
    	console.log('the send success');
        if (webSocket && isConnectSuccess) {
            var messageInfo = {
                userName: 1,
                target:      2,
                message: $('#btn-input').val()
            }
            webSocket.send(JSON.stringify(messageInfo));
        } else {
            infoWindow.innerHTML = "未登入";
        }
    }