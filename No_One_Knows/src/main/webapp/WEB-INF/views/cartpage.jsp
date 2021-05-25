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
		        	<div class="scale"><img src = "resources/img/hot.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div><br>
		            <h2 style=" text-align:center; margin-bottom: 60px;">${sessionScope.userInfo.user_id}님의 결제 목록입니다</h2>
				    <div class="row" style="margin-left: 740px; margin-bottom: 60px;">
				    	<input type="text"  id="search" name="searchKeyword" required="required" value="" style="border-radius: 15%;" />&nbsp;&nbsp;
						<div class="tscale"><input type="submit" id="w-button-search" value="여행지 검색하기" style="background: linear-gradient( to left, #5587ED, #8BBDFF ); color:white; font-family: 'Do Hyeon'; border-radius: 15%;"/></div>
				    </div>
			    </section>
			    <!--카드 시작-->
			    <div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<h4 class="card-title">
						<a href="detail?no=${dto.no}">제목 </a>
					</h4>
				</div>
				<div class="card-body">
				<h5 class="card-title">
					&nbsp;
					<small>
						(<c:choose>
							<c:when test="${dto.regdate.getYear() == tyear && dto.regdate.getMonth() == tmonth && dto.regdate.getDate() == tdate }">
								<f:formatDate value="${dto.regdate}" pattern="HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								<f:formatDate value="${dto.regdate}" pattern="yyyy/MM/dd"/>
							</c:otherwise>
						</c:choose>)
					</small>
				</h5>
				<p class="card-text">${dto.subtitle} 클릭하면 디테일</p>
				<p class="card-text">구분 : ${dto.divide}</p>	
				<p class="card-text">조회수 : ${dto.readcount}</p>
				<div class="tscale"><a href = "#" style="text-decoration:none"><button style="background: linear-gradient( to left, #FAED7D, #FFCD12 ); color:white; border-radius: 15%; display: block; margin-top: 10px auto; "><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;결제하기</h5></button></a></div>
				</div>
			</div>
	        </div>
	    </header>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>