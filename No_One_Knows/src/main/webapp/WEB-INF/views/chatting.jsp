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
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
	#messageInput {
		width: 100%,
		top: 90%
		position: fixed;
	}
</style>
<header style="background-color: white; height: 50px"></header>
<body>
        <nav class="navbar">
            <div class="container"  style="margin-top: 65px;">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="/board/main"><b><h3 style="font-size:25px; background: linear-gradient( to right, white, #C4DEFF ); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">NO ONE KNOWS</h3></b></a>
            		
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a href="/board/login"><h5 style="color:#E8FFFF; font-size:13px;">로그인</h5></a></div>
            		<div class="hevent"><a href="/board/signup"><h5 style="color:#E8FFFF; font-size:13px">회원가입</h5></a></div>
					<div class="hevent"><a href="/board/adminlogin"><h5 style="color:#E8FFFF; font-size:13px">관리자로 로그인</h5></a></div>
<%
	} else {%>
					<h5 style="color:#E8FFFF; font-size:13px">${sessionScope.userInfo.user_id} 님 환영합니다!</h5>
                    <div class="hevent"><a href="/board/logout"><h5 style="color:#E8FFFF; font-size:13px">로그아웃</h5></a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a href="/board/likepage" style="color:white; font-size:14px;"><img src = "${pageContext.request.contextPath}/resources/img/heart2.png" style="width: 18px; height:18px;">&nbsp;&nbsp;내가 찜한 코스</a></div>
            		<div class="tscale"><a href="/board/cartpage" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/cart.png" style="width: 18px; height:18px;">&nbsp;&nbsp;장바구니</a></div>
                    <div class="tscale"><a href="/board/mypage/${sessionScope.userInfo.user_no}" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/info.png" style="width: 18px; height:18px;">&nbsp;&nbsp;마이페이지</a></div>
                    <div class="tscale"><a href="/board/coursemaker" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/check.png" style="width: 18px; height:18px;">&nbsp;&nbsp;여행코스 만들기</a></div>
            		<div class="tscale"><a href="/board/chatroom" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/chat.png" style="width: 20px; height:20px;">&nbsp;&nbsp;커뮤니티</a></div>
            	</div>
            </div>
        </nav>
      	
        <!-- Page Content-->
        <div id="wrapper"><br><br><br>
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#top" class="active">TOP</a></li>
							<li><a href="#bottom">BOTTOM</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
					<a id="top"></a>
							<section class="main">
									<section class="container">
									   <p style="text-align: center">${roomInfo.room_no}번 방에 입장했습니다.</p>
									   <h2 style="text-align: center">${roomInfo.room_name}</h2>
									    <h4 style="text-align: center">${roomInfo.room_content}</h4>
								    </section>
								    <div> 
								    <div id="main">
										<div class="inner">
											<div id="chatArea">
											  <div style="overflow:scroll; height:400px;">
											   <div style="margin: 50px" id="messageArea"></div>
											  
											   </div>
											   </div>
											<div id="messageInput">
												<section class="container">
												    <div class="row" style="margin-top: 50px;">
												    	<input type="text" id="message" onkeyup="sendMessageForEnter()" />
											   			<input type="button" id="sendBtn" value="보내기" style="margin-top: 20px; margin-left: 450px"/>
												    </div>
											    </section>
											</div>
										</div>
									</div>
								    </div>
									</section>
									<a id="bottom"></a>
							</div><br>
					</div>

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
			"chat_message" : "${chat.chat_message}",
			"user_photo" : "${chat.user_photo}"
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
				"user_photo" : "${userInfo.user_photo}",
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
		"user_photo" : "${userInfo.user_photo}",
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
		"chat_message" : receive[2],
		"user_photo" : receive[3]
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
	   appendMessageTag(LR, data.user_id, data.chat_message, data.user_photo);
   }
   
   function appendMessageTag(LR_className, name, message, photo) {
	   //let divForm =  $("#messageArea").clone();
	   console.log(name + message + photo);
	   //divForm.add
	   $("#messageArea").append("<img align=" + LR_className + " src='${pageContext.request.contextPath}/resources/img/"+photo+"' style='width: 30px; height: 30px'><br><p align=" + LR_className + ">[" + name + "]&nbsp;" + message + "</p>");
	   //$("#messageArea").append("<p align=" + LR_className + ">[" + name + "]" + message + "</p>");
	   //$("#messageArea").append("[" + name + "] " + message + "<br/>");
	   //document.body.scrollTop = document.body.scrollHeight;
	   
	   console.log($("#chatArea").prop('scrollHeight'));
	   $("#chatArea").scrollTop($("#sendBtn").prop('scrollHeight'));
   }
</script>
<script src="resources/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html>