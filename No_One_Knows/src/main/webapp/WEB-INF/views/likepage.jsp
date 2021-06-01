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
 <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
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
		selectContent();
		selectCategory();
	});
	
	function selectContent() {
		var user_no = "${sessionScope.userInfo.user_no}";
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/likepage/likelist/'+user_no, 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}
	
	function selectCategory() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/likepage/category', 
		}).done(function( data ) {
		 	displayCategoryList(data); //만들기
		});
	}
	
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<div class="card mb-4">';
	  		mytable += '<img class="card-img-top" src="resources/img/'+val['map_photo']+'"/>';
	  		mytable += '<div class="card-body" style="background-color: white">';
	  		mytable += '<h2 class="card-title">'+val['map_title']+'</h2>';
	  		mytable += '<h5 class="card-text">'+val['map_subtitle']+'</h5>';
	    	mytable += '<p class="card-text">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	    	mytable += '<p class="card-text">'+val['map_placett']+'</p>';
	    	mytable += '<p class="card-text">'+val['map_like']+'</p>';
	    	mytable += '<button class="deleteLikeButton" myval="'+val['map_no']+'" style="background-color: white; border-radius: 10px"><h5>삭제</h5></button>&nbsp;&nbsp;';
	    	mytable += '<button class="gotoCartButton" myval="'+val['map_no']+'" style="background-color: white; border-radius: 10px"><h5>장바구니로 이동</h5></button></div>';
	    	mytable += '<div class="card-footer text-muted" style="background-color: white">';
	    	mytable += '<p class="card-text">'+val['map_regdate']+'</p>';
	    	mytable += '</div></div>';
	  		});
		$('#displayLikeContent').html(mytable);
		deleteLikeButtonEvent();
		gotoCartButtonEvent();
	}
	
	function deleteLikeButtonEvent(){
		$('.deleteLikeButton').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/likepage/delete/' + $(this).attr('myval') +'/' + user_no 
			}).done(function( data ) {
				alert('삭제가 완료되었습니다.');
				displayContentList(data);
			});
		});
	}
	
	function gotoCartButtonEvent(){
		$('.gotoCartButton').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/likepage/gotocart/' + $(this).attr('myval') +'/' + user_no 
			}).done(function( data ) {
				alert('장바구니로 이동이 완료되었습니다.');
				displayContentList(data);
			});
		});
	}
	
	function displayCategoryList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<li><div class="row">&nbsp;&nbsp;<button class="categoryButton" myval="'+val['theme_no']+'" style="background-color: transparent; border: none"><h5 style="color: #6799FF">'+val['theme_name']+'</h5></button>&nbsp;&nbsp;<small>'+val['theme_content']+'</small></div></li>';
	  		});
		$('#displayCategory').html(mytable);
		categoryButtonEvent(); 
	}
	
	
	//카테고리별 분류 이벤트 추가
	function categoryButtonEvent() {
		$('.categoryButton').click(function(){
			var user_no = "${sessionScope.userInfo.user_no}";
			$.ajax({
				method : 'GET',
				url :'${pageContext.request.contextPath}/likepage/category/' + $(this).attr('myval') +'/' + user_no 
			}).done(function( data ) {
				displayContentList(data);
			});
		});
	}
</script>
</head>
	<body>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
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
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a class="navbar-brand" href="likepage" style="color:#878787; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src = "resources/img/heart.png" style="width: 25px; height:25px;">&nbsp;내가 찜한 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
            		<div class="tscale"><a class="navbar-brand" href="cartpage" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/cart.png" style="width: 28px; height:28px;">&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="tscale"><a class="navbar-brand" href="mypage/${sessionScope.userInfo.user_no}" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/user.png" style="width: 25px; height:25px;">&nbsp;마이페이지</a></div>
            	</div>
            </div>
        </nav><br><br>
      	
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );">
	        <div class="container">
		        <section class="container" style="margin-top: 10px;">
		        	<div class="scale"><img src = "${pageContext.request.contextPath}/resources/img/${sessionScope.userInfo.user_photo}"  style="width: 110px; height:110px; display: block; margin: 0px auto;"></div><br>
		            <h2 style=" text-align:center; margin-bottom: 60px;">${sessionScope.userInfo.user_id}님의 찜 목록입니다</h2>
			    </section>
			    <div class="row">
                <!-- Blog entries-->
                <div class="col-md-8">
                    <div id="displayLikeContent">
                    	 
                    </div>
                </div>
                <!-- Side widgets-->
                <div class="col-md-4">
                    <!-- Search widget-->
                    <div class="card my-4">
                        <h5 class="card-header" style="background-color: white">Search</h5>
                        <div class="card-body" style="background-color: white">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search for..." />
                                <span class="input-group-append"><button class="btn btn-secondary" type="button">Go!</button></span>
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card my-4">
                        <h5 class="card-header" style="background-color: white">테마별 분류</h5>
                        <div class="card-body" style="background-color: white">
                            <div class="row">
                                <div class="col-lg-6">
                                    <ul class="list-unstyled mb-0">
                                    	<div id="displayCategory">
                                        <!-- 카테고리 디스플레이 -->
                                        </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	        </div>
	    </header>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>