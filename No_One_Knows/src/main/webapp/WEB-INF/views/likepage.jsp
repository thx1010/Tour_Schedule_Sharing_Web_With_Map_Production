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
		selectCategory();
	});
	
	function selectContent(page_no) {
		var user_no = "${sessionScope.userInfo.user_no}";
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/likepage/likelist/'+user_no+'/'+page_no, 
		}).done(function( data ) {
		 	displayContentList(data.likeList);
		 	displayPageList(data.pageDTO);
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
	  		mytable += '<img class="card-img-top" src="resources/img/'+val['map_photo']+'" style=" height: 380px"/>';
	  		mytable += '<div class="card-body" style="background-color: white">';
	  		mytable += '<h1 class="card-title" style="font-size: 35px">'+val['map_title']+'</h1>';
	  		mytable += '<h2 class="card-text" style="font-size: 20px">'+val['map_subtitle']+'</h2>';
	    	mytable += '<p class="card-text" style="font-size: 15px">'+val['map_country']+'&nbsp;'+val['map_state']+'&nbsp;'+val['map_city']+'</p>';
	    	mytable += '<p class="card-text" style="display:inline"><img src="resources/img/heart.png" style="width: 20px; height: 20px"/>&nbsp;&nbsp;<h5 style="display:inline; color: #FF8383">'+val['map_like']+'</h5></p>';
	    	mytable += '<button class="deleteLikeButton button small" myval="'+val['map_no']+'" style="background-color: white; border-radius: 10px"><p style="font-size: 14px;">삭제</p></button>&nbsp;&nbsp;';
	    	mytable += '<button class="gotoCartButton button small" myval="'+val['map_no']+'" style="background-color: white; border-radius: 10px"><p style="font-size: 14px;">장바구니로 이동</p></button></div>';
	    	mytable += '<div class="card-footer text-muted" style="background-color: white">';
	    	mytable += '<p class="card-text" style="font-size: 15px">'+val['map_regdate']+'</p>';
	    	mytable += '</div></div>';
	  		});
		$('#displayLikeContent').html(mytable);
		deleteLikeButtonEvent();
		gotoCartButtonEvent();
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
	  		mytable += '<li><div style="margin-left: 43px; text-align: center">&nbsp;&nbsp;<button class="categoryButton" myval="'+val['theme_no']+'" style="background-color: transparent; border: none"><p style="font-size: 15px">'+val['theme_name']+'</></button></div></li>';
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
<header style="background-color: white; height: 60px"></header>
	<body>
       <nav class="navbar">
            <div class="container"  style="margin-top: 50px;">
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
        <div id="wrapper"><br><br>
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#top" class="active">TOP</a></li>
							<li><a href="#bottom">BOTTOM</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
							<section id="intro" class="main">
								<a id="top"></a>
								<div class="spotlight">
									<div class="content">
										<section>
											<div class="container" id="main">
										    <div class="row">
							                <!-- Blog entries-->
							                <div class="col-md-8">
							                    <div id="displayLikeContent">
							                    	 
							                    </div>
							                </div>
							                <!-- Side widgets-->
							                <div class="col-md-4">
							                    <!-- Search widget-->
							                    <!-- Categories widget-->
							                    <div class="card my-6">
							                        <h5 class="card-header" style="background-color: white">테마별 분류</h5>
							                        <div class="card-body" style="background-color: white">
							                            <div class="row">
							                                <div class="col-lg-6">
							                                    <ul class="list-unstyled mb-0">
							                                    	<div id="displayCategory">
							                                        <!-- 카테고리 디스플레이 -->
							                                        </div>
							                                        <a id="bottom"></a>
							                                    </ul>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							            </div>
							            </div>
							            <div id="page">
							   			<!-- 페이징 -->
							   		    </div>
										</section>
									</div>
								</div>
							</section>
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