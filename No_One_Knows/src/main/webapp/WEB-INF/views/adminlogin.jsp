<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>

<link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
<link href="resources/css/style.css" rel="stylesheet"><link href="css/style-responsive.css" rel="stylesheet">
 <link href="resources/css/jquery-sakura.css" rel="stylesheet" type="text/css" />
 <noscript><link rel="stylesheet" href="resources/css/noscript.css" /></noscript>
</head>
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
        <header>
	        <section class="container mt-3" style="max-width: 560px; height: 1000px">
	        	<!--login content -->
	        	<br><br><br><br>
				<form method="post" style="display: block; margin-top: 30px;">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" name="admin_id" class="form-control">		
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="admin_pw" class="form-control">
					</div><br><br>
					<div style="text-align: center"><button type="submit" style="background-color:white; border-radius: 10px"><p style="color: #868686">로그인</p></button></div>
				</form>
			</section>
	    </header>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script>
		$(window).load(function () {
		    $('body').sakura();
		});
		</script>
        <!-- Bootstrap core JS-->
        <script src="resources/js/jquery-sakura.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
</html>