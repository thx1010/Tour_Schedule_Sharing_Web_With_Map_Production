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
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resources/css/slider2.css" type="text/css" />
 <!-- Bootstrap core CSS -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
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
	});
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/main/origin', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<div class="col-lg-3 col-md-6 mb-4" style="margin-top: 50px;">';
	  		mytable += '<a href = "mapcontrol/coursedraw/'+val['map_no']+'">';
	  		mytable += '<div id="blur" class="card h-100">';
	  		mytable += '<div class="tscale">';
	  		mytable += '<img class="card-img-top" src="resources/img/'+val['map_photo']+'"/></a>';
	    	mytable += '<div class="card-body" style="background-color: white">';
	    	mytable += '<h4 class="card-title">'+val['map_title']+'</h4>';
	    	mytable += '<p class="card-text">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	    	mytable += '<p class="card-text"><img src="resources/img/'+val['user_photo']+'" style="width: 22px; height: 22px"/>&nbsp;&nbsp;'+val['user_id']+'</p>';
	    	mytable += '<p class="card-title">'+val['register_regdate']+'</p>';
	    	mytable += '<button class="detailmodalButton" myval="' + val['map_no'] + '"style="background-color: white; border-radius: 10px;" data-toggle="modal" data-target="#detailModal">자세히 보기</button>';
	    	mytable += '</div></div></div></div>';
	  		});
		$('#photoList').html(mytable);
		newlistButtonEvent();
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
	  		mytable += '<br><p style="text-align: center; color: #F15F5F"><small>* 자세한 내용은 포인트 결제를 진행하셔야 확인하실 수 있습니다 *</small></p>';
	  		mytable += '<br><h2 style="text-align: center">' + val['map_title'] + '</h2>';
	  		mytable += '<h5 style="text-align: center">'+val['map_subtitle']+'</h5><br>';
	  		mytable += '<p style="text-align: center">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	  		mytable += '<div style="text-align: center"><img src="resources/img/'+val['user_photo']+'" style=" width: 25px; height: 25px;"></div>';
	  		mytable += '<p style="text-align: center">'+val['user_id']+'</p><br>';
	  		mytable += '<p style="text-align: center">'+val['register_regdate']+'</p><br>';
	  		mytable += '<br><div class="row" style="margin-left: 290px"><button class="tocart" style="background-color: white; border-radius: 10px;" mapval="'+val['map_no']+'" userval="'+val['user_no']+'"><img src="resources/img/cart.png" style="width: 30px; height: 30px">&nbsp;장바구니</button>&nbsp;&nbsp;<button class="tolike" style="background-color: white; border-radius: 10px;" mapval="'+val['map_no']+'" userval="'+val['user_no']+'"><img src="resources/img/heart.png" style="width: 30px; height: 30px">&nbsp;찜하기</button></div><br>';
	  		});
		$('#mapdata').html(mytable);
		tocartButtonEvent();
		tolikeButtonEvent();
	}
	
	function tocartButtonEvent() {
		$('.tocart').click(function(){
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/cart/' + $(this).attr('mapval') + '/' + $(this).attr('userval'),
			}).done(function() {
				alert('장바구니에 추가되었습니다 !');
			});
		});
	}
	
	function tolikeButtonEvent() {
		$('.tolike').click(function(){
			$.ajax({
				method : 'POST',
				url :'${pageContext.request.contextPath}/main/like/' + $(this).attr('mapval') + '/' + $(this).attr('userval'),
			}).done(function() {
				alert('나의 찜 목록에 추가되었습니다 !');
			});
		});
	}

</script>
</head>
<header class="header black-bg">
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
              <span class="badge bg-theme">4</span>
<% 
	}
%>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green"></p>
              </li>
              <li>
                <a href="#notice">
                  <div class="task-info">
                    <div class="desc">공지 사항 확인하기</div>
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
 <% 
	if(session.getAttribute("userInfo") == null){ 
%>
<% 
	} else {
%>
              <span class="badge bg-warning">5</span>
<% 
	}
%>
              </a>
            <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">You have 5 new messages</p>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="img/ui-zac.jpg"></span>
                  <span class="subject">
                  <span class="from">Zac Snider</span>
                  </span>
                  <span class="message">
                  Hi mate, how is everything?
                  </span>
                  </a>
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
              <li>
                <p class="yellow">You have 7 new notifications</p>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Server Overloaded.
                  </a>
              </li>
            </ul>
          </li>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
    </header>
	<body>
       <nav class="navbar navbar-expand-lg" style="background-color: white;">
            <div class="container"  style="background-color: white; margin-top: 70px;">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a class="navbar-brand" href="login" style="color:#BDBDBD; font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인</a></div>
            		<div class="hevent"><a class="navbar-brand" href="signup" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></div>
					<div class="hevent"><a class="navbar-brand" href="adminlogin" style="color:#6799FF; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자로 로그인</a></div>
<%
	} else {%>
					<p class="navbar-brand" style="color:#6799FF; font-size:14px">${sessionScope.userInfo.user_id} 님 환영합니다!</p>
                    <div class="hevent"><a class="navbar-brand" href="logout" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg" style="background-color: white;">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a class="navbar-brand" href="likepage" style="color:#878787; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src = "resources/img/heart.png" style="width: 25px; height:25px;">&nbsp;내가 찜한 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
            		<div class="tscale"><a class="navbar-brand" href="cartpage" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/cart.png" style="width: 28px; height:28px;">&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="tscale"><a class="navbar-brand" href="mypage/${sessionScope.userInfo.user_no}" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/user.png" style="width: 25px; height:25px;">&nbsp;마이페이지</a></div>
            	</div>
            </div>
        </nav>
        <!-- Page Content-->
        <div style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) ); margin-top: 80px;">
	        <div class="container">
		        <div class="parent">
			        <div class="first">
			        	<!-- regdate 순서대로 정렬 -->
			        	<button class="newlist" style="background-color: transparent; border: none"><div class="scale"><img src = "resources/img/hot.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div><br>
			        	<h5 style="text-align: center; color:#5D5D5D;">NEW ! 지금 뜨는 코스</h5></button>
			        	<br><br><br>
			        </div>
			            <!-- 찜 갯수 순서대로 정렬 -->
			        <div class="second">
			        	<button class="bestlist" style="background-color: transparent; border: none"><div class="scale"><img src = "resources/img/sea.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div> <br>
			        	<h5 style="text-align: center; color:#5D5D5D;">요즘 대세 코스</h5></button>
			        	<!--<p style="text-align: center; font-size:14px; color:#878787; ">N0.1 Knows 먼저 알아가기</p> -->
			        	<br><br><br>
			        </div>
			        <div class="third">
			        	<button class="mylist" style="background-color: transparent; border: none"><div class="scale"><img src = "resources/img/plane.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div> <br>
			        	<h5 style="text-align: center; color:#5D5D5D;">나에게 딱 맞는 여행지 추천</h5></button>
			        	<!--<p style="text-align: center; font-size:14px; color:#878787; ">낭만을 바란다면 랜덤 여행지로 !</p> -->
			        	<br>
			        </div>
			        <div class="forth"><br>
			        	<div class="tscale"><a href = "coursemaker" style="text-decoration:none"><button style="background: linear-gradient( to left, #FAED7D, #FFCD12 ); color:white; border-radius: 15%; display: block; margin-top: 10px auto; "><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;여행코스 만들기</h5></button></a></div><br>
			        	<div class="tscale"><button style="background: linear-gradient( to left, #FAED7D, #FFCD12 ); color:white; border-radius: 15%; display: block; margin-top: 10px auto; " data-toggle="modal" data-target="#myModal"><h5><img src = "resources/img/info.png" style="width: 20px; height:20px;">&nbsp;상세 정보 확인</h5></button></div>
			        	<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"></h4>
						      </div>
						      <div class="modal-body">
						        <!-- 프로젝트 설명 -->
						        No One Knows
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div></div>
						  <!-- Detail Modal -->
						  <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
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
								<p style="text-align: center">[ 댓글 모음이 들어갈 자리 ]</p>
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div></div>
						  <!-- Detail Modal Finish -->
			        </div>
			    </div>
			    <style>
			    #blur{opacity: 0.6}
			    #blur:hover{opacity: 1.0; transition:1.1s}
			    </style>
		       <div class="row text-center" id = "photoList"> 
               </div>
               <div class="row text-center" id = "photoNewList"> 
               </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top: 50px; width: 730px; margin-left: 210px; background-color: white">
		       <tr><a name="notice"></a>
		         <th><h5>공지사항</h5></th>
		        </tr>
		        <tr>
		          <td><p style="text-size: 17px;"><b>공지사항 1 제목</b></p>
		          <p style="text-size: 15px;">관리자 이름</p>
		          </td>
		        </tr>
		     </table>
        </div><br><br><br><br>
	    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>