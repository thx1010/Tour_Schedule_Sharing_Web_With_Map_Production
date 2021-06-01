<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<style type="text/css">
	#messageInput {
		width: 100%,
		top: 90%
		position: fixed;
	}
</style>
<body>
	<div id="chatArea">
	   <div id="messageArea"></div>
	  
	</div>
	<div id="messageInput" style="float: right;">
	   <input type="text" id="message" onkeyup="sendMessageForEnter()"/>
	   <input type="button" id="sendBtn" value="보내기" />
	</div>
</body>
<script type="text/javascript">
   $("#sendBtn").click(function() {
      sendMessage();
      $('#message').val('')
   });
   

   let sock = new SockJS("http://localhost:8080/board/echo/");
   sock.onmessage = onMessage;
   sock.onopen = onOpen;
   sock.onclose = onClose;
   
   
   <c:forEach var="chat" items="${chatHistory}">
  		var hisInfo = {
			"user_name" : "${chat.user_name}",
			"user_id" : "${chat.user_id}",
			"chat_message" : "${chat.chat_message}"
	    };
   		CheckLR(hisInfo);
   </c:forEach>
   
   
   function onOpen() {
	   const msg = {
		    	"chat_no" : 0,
				"room_no" : ${roomInfo.room_no},
				"user_no" : ${userInfo.user_no},
				"user_name" : "${userInfo.user_name}",
				"user_id" : "${userInfo.user_id}",
				"chat_message" : "ENTER-CHAT",
				"chat_date" : "0"
		      }
	      
	      let jsonData = JSON.stringify(msg);
	      sock.send(jsonData);
   }
   
   // 메시지 전송
   function sendMessage() {
      //var msg = "${userInfo.user_name} : " + $("#message").val();
      const msg = {
    	"chat_no" : 0,
		"room_no" : ${roomInfo.room_no},
		"user_no" : ${userInfo.user_no},
		"user_name" : "${userInfo.user_name}",
		"user_id" : "${userInfo.user_id}",
		"chat_message" : $('#message').val(),
		"chat_date" : "0"
      }
      
      let jsonData = JSON.stringify(msg);
      console.log(jsonData);
      sock.send(jsonData);
   }
   // 서버로부터 메시지를 받았을 때
   function onMessage(msg) {
      //var data = msg.data;
      console.log(msg);
      let receive = msg.data.split(",");
      console.log(receive);
      const data = {
		"user_name" : receive[0],
		"user_id" : receive[1],
		"chat_message" : receive[2]
      };
	
      CheckLR(data);
      //$("#messageArea").append(data + "<br/>");
   }
   // 서버와 연결을 끊었을 때
   function onClose(evt) {
      $("#messageArea").append("연결 끊김");

   }
   
   function sendMessageForEnter() {
      if(window.event.keyCode == 13) {
         sendMessage();
         $('#message').val('');
      }
   }
   
   function CheckLR(data) {
	   const LR = data.user_id != "${userInfo.user_id}" ? "left" : "right";
	   appendMessageTag(LR, data.user_name, data.chat_message);
   }
   
   function appendMessageTag(LR_className, name, message) {
	   //let divForm =  $("#messageArea").clone();
	   console.log(name + message);
	   //divForm.add
	   
	   $("#messageArea").append("<p align=" + LR_className + ">[" + name + "]" + message + "</p>");
	   //$("#messageArea").append("[" + name + "] " + message + "<br/>");
	   //document.body.scrollTop = document.body.scrollHeight;
	   
	   console.log($("#chatArea").prop('scrollHeight'));
	   $("#chatArea").scrollTop($("#sendBtn").prop('scrollHeight'));
   }
</script>
</html>