<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resources/css/slider2.css" type="text/css" />
<link href="resources/css/style.css" rel="stylesheet"><link href="css/style-responsive.css" rel="stylesheet">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
   rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
/>
 <script type="text/javascript">
	$(document).ready(function(){
		selectContent();
		selectMessageContent();
		selectMessageCount();
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
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/main/origin', 
		}).done(function( data ) {
			$(".viewMoreButton").fadeIn();
		 	displayContentList(data);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<div class="col-lg-3 col-md-6 mb-4" style="margin-top: 50px;">';
	  		mytable += '<div id="blur" class="card h-100">';
	  		mytable += '<img class="card-img-top" src="resources/img/'+val['map_photo']+'"/>';
	    	mytable += '<div class="card-body" style="background-color: white">';
	    	mytable += '<h2 class="card-title">'+val['map_title']+'</h2>';
	    	mytable += '<p class="card-text">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	    	mytable += '<p class="card-text" style="display:inline"><img src="resources/img/'+val['user_photo']+'" style="width: 22px; height: 22px"/>&nbsp;&nbsp;'+val['user_id']+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/img/heart.png" style="width: 20px; height: 20px"/>&nbsp;&nbsp;<h4 style="display:inline; color: #FF8383">'+val['map_like']+'</h4></p>';
	    	mytable += '<p class="card-text">'+val['register_regdate']+'</p>';
	    	mytable += '<button class="detailmodalButton" myval="' + val['map_no'] + '"style="border: 1px solid #9F9F9F; border-radius: 10px;" data-toggle="modal" data-target="#detailModal"><p style="color: #9F9F9F">자세히 보기</p></button>';
	    	mytable += '</div></div></div>';
	  		});
		$('#photoList').html(mytable);
		newlistButtonEvent();
		bestlistButtonEvent();
		mylistButtonEvent();
		viewMoreButtonEvent();
		detailmodalButtonEvent();
		mapDataEvent();
	}
	
	//최신순 정렬
	function newlistButtonEvent() {
		$('.newlist').click(function(){
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/main/newlist'
			}).done(function( data ) {
				$(".viewMoreButton").fadeIn();
				displayContentList(data);
			});
		});
	}
	
	//좋아요순 정렬
	function bestlistButtonEvent() {
		$('.bestlist').click(function(){
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/main/bestlist'
			}).done(function( data ) {
				$(".viewMoreButton").fadeIn();
				displayContentList(data);
			});
		});
	}
	
	//테마 정렬
	function mylistButtonEvent() {
		$('.mylist').click(function(){
			var theme_no = "${sessionScope.userInfo.theme_no}";
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/main/mylist/'+ theme_no
			}).done(function( data ) {
					$(".viewMoreButton").fadeOut();
					displayContentList(data);
			});
		});
	}
	
	// 더보기 버튼
	function viewMoreButtonEvent() {
		$('.viewMoreButton').click(function(){
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/main/viewmore'
			}).done(function( data ) {
				$(".viewMoreButton").fadeOut();
				displayContentList(data);
			});
		});
	}
	
	function detailmodalButtonEvent() {
		$('.detailmodalButton').click(function(){
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/detailmodal/' + $(this).attr('myval'),
			}).done(function( data ) {
				displayImageSlide(data);
			});
		});
	}
	
	function mapDataEvent() {
		$('.detailmodalButton').click(function(){
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/mapdata/' + $(this).attr('myval'),
			}).done(function( data ) {
				displayMapData(data);
				});
			});
	}
	
	function displayImageSlide(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<li><div style="text-align: center"><img src="resources/img/' + val['place_photo'] + '" style="height: 400px; width: 650px;"></div></li>';
	  		});
		$('#imgholder').html(mytable);
		//댓글 불러오기 이벤트 넣기
	}
	
	//이미지 슬라이드 위로 맵 정보 집어넣음
	function displayMapData(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<br><p style="text-align: center; color: #F15F5F; font-size: 10px">* 자세한 내용은 포인트 결제를 진행하셔야 확인하실 수 있습니다 *</p>';
	  		mytable += '<br><h2 style="text-align: center; font-size: 42px">' + val['map_title'] + '</h2>';
	  		mytable += '<h5 style="text-align: center; font-size: 23px">'+val['map_subtitle']+'</h5><br>';
	  		mytable += '<p style="text-align: center">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	  		mytable += '<div style="text-align: center"><img src="resources/img/'+val['user_photo']+'" style=" width: 25px; height: 25px;"></div>';
	  		mytable += '<p style="text-align: center">'+val['user_id']+'</p>';
	  		mytable += '<p style="text-align: center">'+val['register_regdate']+'</p><br>';
	  		mytable += '<div class="row" style="margin-left: 260px;"><button class="tocart" style="border: 1px solid #9F9F9F; border-radius: 10px;" mapval="'+val['map_no']+'" userval="'+val['user_no']+'" data-dismiss="modal"><p style="color: #9F9F9F">장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></button>&nbsp;&nbsp;<button class="tolike" style="border: 1px solid #9F9F9F; border-radius: 10px;" mapval="'+val['map_no']+'" userval="'+val['user_no']+'" data-dismiss="modal"><p style="color: #9F9F9F">찜하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></button></div><br>';
	  		});
		$('#mapdata').html(mytable);
		tocartButtonEvent();
		tolikeButtonEvent();
	}
	
	function tocartButtonEvent() {
		$('.tocart').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/cart/' + $(this).attr('mapval') + '/' + user_no,
				error: function (request, status, error) {
			        alert("이미 장바구니 목록에 추가된 게시글입니다.");
			    }
			}).done(function() {
					alert('장바구니 목록에 추가되었습니다 !');
			});
		});
	}
	
	function tolikeButtonEvent() {
		$('.tolike').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/like/' + $(this).attr('mapval') + '/' + user_no,
				error: function (request, status, error) {
			        alert("이미 찜 목록에 추가된 게시글입니다.");
			    }
			}).done(function(data) {
					alert('나의 찜 목록에 추가되었습니다 !');
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
        <div>
	        <div class="container" style="margin-top: 70px;">
		        <div class="parent" style="margin-left: 270px">
			        <div class="first">
			        	<!-- regdate 순서대로 정렬 -->
			        	<button class="newlist"><p style= "color:white;">NEW  !  지금 뜨는 코스</p></button>
			        </div>
			            <!-- 찜 갯수 순서대로 정렬 -->
			        <div class="second">
			        	<button class="bestlist"><p style= "color:white;">요즘  대세  코스 BEST</p></button>
			        </div>
			        <div class="third">
			        	<button class="mylist"><p style= "color:white;">나에게 딱  맞는  여행지  추천</p></button>
			        </div>
			       
			    </div>
			    <style>
			    #blur{opacity: 0.7}
			    #blur:hover{opacity: 1.0; transition:1.1s}
			    </style>
			     <!-- Detail Modal -->
						  <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header" style="background: linear-gradient(to right, #efa8b0, #a89cc8, #8cc9f0);">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="detailModalLabel"></h4>
						      </div>
						      <div class="modal-body">
						      	<div id="mapdata">

						      	</div>
						     	<div class="slider">
								    <input type="radio" name="slide" id="slide1" checked>
								    <input type="radio" name="slide" id="slide2">
								    <input type="radio" name="slide" id="slide3">
								    <ul id="imgholder" class="imgs"> <!-- 이미지 슬라이드 넣기 -->
								    
								    </ul>
								    <div class="bullets">
								        <label for="slide1">&nbsp;</label>
								        <label for="slide2">&nbsp;</label>
								        <label for="slide3">&nbsp;</label>
								    </div>
								</div>
								<div id="commentlist"> <!-- 댓글 넣기 -->

								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div></div>
						  <!-- Detail Modal Finish -->
		       <div class="row text-center" id = "photoList"> 
               </div>
               <div class="row text-center" id = "photoNewList"> 
               </div>
               <div style="text-align: center"><button class="viewMoreButton" style="background-color:white; border-radius: 10px"><p style="color: #868686">더 살펴보기</p></button></div>
               <section style="margin-top: 60px"><a id="notice"></a>
										<h3 style="color: white">공지 사항</h3>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th>번호</th>
														<th>공지사항 내용</th>
														<th>게시 날짜</th>
													</tr>
												</thead>
												<tbody><!-- 이 부분 반복 -->
												<c:forEach items="${noticelist}" var="dto">
													<tr>
														<td style="color: white">${dto.notice_no}</td>
														<td style="color: white">${dto.notice_content}</td>
														<td style="color: white">${dto.notice_date}</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</section>
        </div><br><br><br><br>
	    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>