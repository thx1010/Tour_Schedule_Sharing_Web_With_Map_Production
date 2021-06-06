<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link href="resources/css/style.css" rel="stylesheet">

<link
   rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
/>
<link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	//유저가 접속 중인 상태
	if(session.getAttribute("userInfo") != null){
	//유저가 접속이 되어있지 않은 상태
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'login'");
		script.println("</script>");
		script.close();
	}
%>
<script type="text/javascript">

	$(document).ready(function(){
		selectContent(1);
	});
	
		function selectMessageContent() {
		var user_no = "${sessionScope.userInfo.user_no}";
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/main/message/' + user_no , 
		}).done(function( data ) {
		 	displayMessageContentList(data);
		});
	}
	
	function selectMessageCount() {
		var user_no = "${sessionScope.userInfo.user_no}";
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/main/messagecount/' + user_no , 
		}).done(function( data ) {
		 	displayMessageCountList(data);
		});
	}
	
	function displayMessageCountList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += val['message_count'];
	  		});
		$('#messagecount').html(mytable);
	}
	
	function displayMessageContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<a href="/board/echo/chat/'+val['room_no']+'">';
	  		mytable += '<span class="photo"><img src="resources/img/'+val['user_photo']+'"></span>';
	  		mytable += '<span class="subject">';
	  		mytable += '<span class="from">'+val['user_name']+'</span></span>';
	  		mytable += '<span class="message">'+val['chat_message']+'<p style="font-size: 11px; color: #A6A6A6">'+val['chat_date']+'</p></span></a>';
	  		});
		$('#displaymessagelist').html(mytable);
	}
	
	function selectContent(page_no) {
		var user_no = "${sessionScope.userInfo.user_no}";
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/cartpage/cartlist/'+user_no +'/' + page_no, 
		}).done(function( data ) {
			//console.log(data.pageDTO);
			//console.log(data.cartList);
		 	displayContentList(data.cartList);
		 	displayPageList(data.pageDTO);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		//mytable += '<div class="card bg-light mt-3">';
	  		mytable += '<div class="card-header bg-light">';
	  		mytable += '<div class="card-body" style="border-radius: 15px;>';
	  		mytable += '<h4 style="font-size: 30px" class="card-title">'+val['map_title']+'</h4></div>';
	  		mytable += '<div class="card-body">';
	    	mytable += '<h3 style="font-size: 22px" class="card-text" style="color: black">'+val['map_subtitle']+'</h3>';
	    	mytable += '<p style="font-size: 15px" class="card-text" style="color: black">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	    	mytable += '<p style="font-size: 15px" class="card-text" style="color: black">'+val['map_regdate']+'</p>';
	    	mytable += '<div class="row">';
	    	mytable += '<div class="tscale"><button class="payformapButton" myval="'+val['map_no']+'" data-toggle="modal" data-target="#payformapModal"><h5>결제하기</h5></button></div>';
	    	mytable += '&nbsp;&nbsp;<div class="tscale"><button class="removefromcartButton" myval="'+val['map_no']+'"><h5>삭제</h5></button></div>';
	    	mytable += '</div></div></div>';
	  		});
		$('#cartlist').html(mytable);
		payformapButtonEvent();
		removefromcartButtonEvent();
	}
	
	function payformapButtonEvent(){
		$('.payformapButton').click(function(){
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/cartpage/payformaps/' + $(this).attr('myval')
			}).done(function( data ) {
				displayPayList(data);
			});
		});
	}
	
	function displayPageList(data) {
		var myPage = "";
		myPage += '<a href=# onclick=selectContent(' + data.prevPage + ')><< </a>';
		
		
		for(var i=data.startPage; i<=data.endPage; i++) {
			if(i == data.currentPage) {
				myPage += i + ' ';
			} else {
				myPage += '<a href=# onclick=selectContent(' + i + ')>' + i + ' ' + '</a>';
			}
		}
		
		myPage += '<a href=# onclick=selectContent(' + data.nextPage + ')>>></a>';
		$('#page').html(myPage);
	}
	
	function displayPayList(data) {
		var user_id = "${sessionScope.userInfo.user_id}";
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<br><div style="margin-left: 110px"><table style="width: 550px"><thead><tr><th><h3 style="font-size: 17px; text-align: center;">번호</h3></th>';
	  		mytable += '<th><h3 style="font-size: 17px; text-align: center;">게시물 제목</h3></th>';
	  		mytable += '<th><h3 style="font-size: 17px; text-align: center;">등록 일시</h3></th></tr></thead><tbody>';
	  		mytable += '<tr><td><p style="text-align: center; color: black;">'+val['map_no']+'</p></td>';
	    	mytable += '<td><p style="text-align: center; color: black;">'+val['map_title']+'</p></td>';
	    	mytable += '<td><p style="text-align: center; color: black;">'+val['map_regdate']+'</p></td></tr></tbody></table></div>';
	    	mytable += '<div style="text-align: center"><p class="card-text" style="display:inline;"><img src="resources/img/heart.png" style="width: 20px; height: 20px"/>&nbsp;&nbsp;<h4 style="display:inline; color: #FF8383">'+val['map_like']+'명의 이용자가 이 게시물을 좋아합니다 !</h4></p></div>';
	    	mytable += '<p style="text-align: center; color: black;">게시물 결제 포인트 : 5000P</p>';
	    	mytable += '<p style="text-align: center; color: black;">결제를 진행하시겠습니까?</p>';
	    	mytable += '<div style="text-align: center"><button type="button" class="addPayButton button small" myval="'+val['map_no']+'" style="border: 1px solid #9F9F9F; border-radius: 10px; background-color: white" data-dismiss="modal"><p style="color: black">확인</p></button></div>';
	  		});
		$('#mappaydata').html(mytable);
		addPayButtonEvent();
	}
	
	//검색 이벤트 추가 (수정하기)
	function search() {
		var user_no = "${sessionScope.userInfo.user_no}";
		var searchKeyword = $('#search').val();
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/cartpage/cartlist/search/' + searchKeyword + '/' + user_no,
		}).done(function( data ) {
			displayContentList(data.cartList);
			$('#page').hide();
		 	//displayPageList(data.pageDTO);
		});
	}
	
	function searchForEnter() {
	      if(window.event.keyCode == 13) {
	    	  search();
	      }
	   }
	function addPayButtonEvent(){
		$('.addPayButton').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			var map_no =  $(this).attr('myval');
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/cartpage/paybutton/' + $(this).attr('myval') + '/' + user_no
			}).done(function() {
				alert('포인트 결제가 완료되었습니다!');
				$(location).attr("href", "/board/mapcontrol/coursedraw/"+ map_no);
			});
		});
	}
	
	function removefromcartButtonEvent(){
		$('.removefromcartButton').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/cartpage/delete/' + $(this).attr('myval') +'/' + user_no 
			}).done(function( data ) {
				alert('삭제가 완료되었습니다.');
				displayContentList(data);
			});
		});
	}
	
</script>
</head>
	<header class="header" style=" background-color: white">
      <div class="nav notify-row" id="top_menu" style="margin-left: 150px; margin-top: 20px;">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-tasks"></i>
 <% 
	if(session.getAttribute("userInfo") == null){ 
%>
<% 
	} else {
%>
              <span class="badge bg-theme" id="messagecount"></span>
<% 
	}
%>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              
              <li>
                <a href="#notice">
                  <div class="task-info">
                    <div class="desc"><h5>공지 사항 확인하기</h5></div>
                  </div>
                </a>
              </li>
            </ul>
          </li>
          <!-- settings end -->
          <!-- 두번째 토글-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-envelope-o"></i>
              <span class="badge bg-warning">${noticecount.notice_no}</span>
          </a>
            <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              
              <li>
              <div id = "displaymessagelist">
              
              </div>
              </li>
            </ul>
          </li>
          <!-- inbox dropdown end -->
          <!-- notification dropdown start-->
          <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-bell-o"></i>
     
              </a>
            <ul class="dropdown-menu extended notification">
              <div class="notify-arrow notify-arrow-yellow"></div>
              <c:forEach items="${noticelist}" var="dto">
              <li>
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  <p style="font-size: 12px">${dto.notice_content}</p>
              </li>
              </c:forEach>
            </ul>
          </li>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
    </header>
	<body>
        <nav class="navbar">
            <div class="container"  style="margin-top: 95px;">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; background: linear-gradient( to right, white, #C4DEFF ); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">NO ONE KNOWS</h3></b></a>
            		
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a href="login"><h5 style="color:#E8FFFF; font-size:13px;">로그인</h5></a></div>
            		<div class="hevent"><a href="signup"><h5 style="color:#E8FFFF; font-size:13px">회원가입</h5></a></div>
					<div class="hevent"><a href="adminlogin"><h5 style="color:#E8FFFF; font-size:13px">관리자로 로그인</h5></a></div>
<%
	} else {%>
					<h5 style="color:#E8FFFF; font-size:13px">${sessionScope.userInfo.user_id} 님 환영합니다!</h5>
                    <div class="hevent"><a href="logout"><h5 style="color:#E8FFFF; font-size:13px">로그아웃</h5></a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a href="likepage" style="color:white; font-size:14px;"><img src = "resources/img/heart2.png" style="width: 18px; height:18px;">&nbsp;&nbsp;내가 찜한 코스</a></div>
            		<div class="tscale"><a href="cartpage" style="color:white; font-size:14px"><img src = "resources/img/cart.png" style="width: 18px; height:18px;">&nbsp;&nbsp;장바구니</a></div>
                    <div class="tscale"><a href="mypage/${sessionScope.userInfo.user_no}" style="color:white; font-size:14px"><img src = "resources/img/info.png" style="width: 18px; height:18px;">&nbsp;&nbsp;마이페이지</a></div>
                    <div class="tscale"><a href="coursemaker" style="color:white; font-size:14px"><img src = "resources/img/check.png" style="width: 18px; height:18px;">&nbsp;&nbsp;여행코스 만들기</a></div>
            		<div class="tscale"><a href="chatroom" style="color:white; font-size:14px"><img src = "resources/img/chat.png" style="width: 20px; height:20px;">&nbsp;&nbsp;커뮤니티</a></div>
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
							<section class="main">
								<a id="top"></a>
									 <section class="container">
									    <div class="row" style="margin-left: 270px; margin-bottom: 30px;">
									    	<input type="text"  id="search" name="searchKeyword" required="required" onkeyup="searchForEnter()" value="" style="border-radius: 10px; width: 250px" />
											<input type="button" onclick="search()" id="w-button-search" value="검색" style=" border-radius: 10px; width: 40px"/>
									    </div>
								    </section>
								   <div id="cartlist">
								    
								   </div>
								   <div id="page"></div>
							</section>
							<a id="bottom"></a>
							 <!-- payformapModal -->
						  <div class="modal fade" id="payformapModal" tabindex="-1" role="dialog" aria-labelledby="payformapModalLabel">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header" style="background: linear-gradient(to right, #efa8b0, #a89cc8, #8cc9f0);">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="payformapModalLabel"></h4>
						      </div>
						      <div class="modal-body">
						      	<div id="mappaydata">
								
						      	</div>
						      </div>
						      <div class="modal-footer">
								<br><br>
						      </div>
						    </div>
						  </div></div>
						  <!--  payformapModal Finish -->
					</div><br><br><br>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	</body>
</html>