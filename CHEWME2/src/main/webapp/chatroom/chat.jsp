<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
<script>
        var ws; //一个ws对象就是一个通信管道！！，只要不关浏览器，不关闭服务器就一直开着
        var target="wss://192.168.1.215:8443/Core/WsPushServer?username=max32002";
        $().ready(function connect() {

                 //页面加载判断是否已经开启了target这个通道，如果没有开启，就开启
                 if ('WebSocket' in window) {
                     ws = new WebSocket(target);
                 } else if ('MozWebSocket' in window) {
                     ws = new MozWebSocket(target);
                 } else {
                     alert('WebSocket is not supported by this browser.');
                     return;
                 }


                //onerror , 連線錯誤時觸發  
                ws.onerror = function (event) {
                    alert("登入失敗");
                };

                 //接收消息 
                 ws.onmessage = function (event) {
                    eval("var result="+event.data);

                    if(result.alert!=undefined){
                        $("#content").append(result.alert+"<br/>");
                    }

                    if(result.names!=undefined){
                        $("#userList").html("");
                        $(result.names).each(function(){
                            $("#userList").append(this+"<br/>");
                        });
                    }

                    if(result.from!=undefined){
                        $("#content").append(result.from+" "+result.date+
                                " 说：<br/>"+result.sendMsg+"<br/>");
                    }

                 };
             });


        //点击发送消息触发事件
        function send(){
            var msg = $("#msg").val();
            ws.send(msg);
            $("#msg").val("");
        }
    </script>


    <h3>欢迎 max32002 使用本系统！！</h3>

    <div id="content"
        style="
        border: 1px solid black; width: 400px; height: 300px;
        float: left;
    "></div>
    <div id="userList"
        style="
        border: 1px solid black; width: 100px; height: 300px;
        float:left;
    "></div>

    <div style="clear: both;">
        <input id="msg" />
        <button onclick="send();">send</button>
    </div>

</body>
</html>