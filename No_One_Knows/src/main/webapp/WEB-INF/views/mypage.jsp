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
 <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
 <%
	//유저가 접속 중인 상태
	if(session.getAttribute("userInfo") != null){
	//유저가 접속이 되어있지 않은 상태
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = '/board/login'");
		script.println("</script>");
		script.close();
	}
%>
</head>
	<body>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="/board/main"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand" href="/board/main"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand" href="/board/main"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a class="navbar-brand" href="/board/login" style="color:#BDBDBD; font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인</a></div>
            		<div class="hevent"><a class="navbar-brand" href="/board/signup" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></div>
					<div class="hevent"><a class="navbar-brand" href="/board/adminlogin" style="color:#6799FF; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자로 로그인</a></div>
<%
	} else {%>
					<p class="navbar-brand" style="color:#6799FF; font-size:14px">${sessionScope.userInfo.user_id} 님 환영합니다!</p>
                    <div class="hevent"><a class="navbar-brand" href="/board/logout" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a class="navbar-brand" href="/board/likepage" style="color:#878787; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/heart.png" style="width: 25px; height:25px;">&nbsp;내가 찜한 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
            		<div class="tscale"><a class="navbar-brand" href="/board/cartpage" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/cart.png" style="width: 28px; height:28px;">&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="tscale"><a class="navbar-brand" href="/board/mypage/${sessionScope.userInfo.user_no}" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/user.png" style="width: 25px; height:25px;">&nbsp;마이페이지</a></div>
            	</div>
            </div>
        </nav><br><br>
      	
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );">
	        <div class="container">
		        <section class="container" style="margin-top: 10px;">
		        	<c:forEach items="${userlist}" var="dto">
		        	<div class="scale"><img src = "${pageContext.request.contextPath}/resources/img/${dto.user_photo}" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div><br>
		            <h2 style=" text-align:center; margin-bottom: 60px;">${sessionScope.userInfo.user_id} 님의 회원 정보입니다.</h2>
					    <h4 style=" text-align:center; color:#4374D9; font-size:20px">LEVEL ${dto.gradeDTO.grade_no}.  ${dto.gradeDTO.grade_name}</h4>
					    <br>
					    <div style="background-color:white; border-radius: 90px; width: 380px; display: block; margin: 0px auto;">
						    <br><br>
						    <p style=" text-align:center; font-size:17px"><img src = "${pageContext.request.contextPath}/resources/img/user_2.png" style="width: 28px; height:28px;">&nbsp;&nbsp;${dto.user_name}  (${dto.user_gender})</p>
						    <p style=" text-align:center; font-size:17px"><img src = "${pageContext.request.contextPath}/resources/img/date.png" style="width: 28px; height:28px;">&nbsp;&nbsp;${dto.user_year} . ${dto.user_month} . ${dto.user_day}</p>
						    <p style=" text-align:center; font-size:17px"><img src = "${pageContext.request.contextPath}/resources/img/email.png" style="width: 28px; height:28px;">&nbsp;&nbsp;${dto.user_email}</p>
						    <p style=" text-align:center; font-size:17px"><img src = "${pageContext.request.contextPath}/resources/img/phone.png" style="width: 28px; height:28px;">&nbsp;&nbsp;${dto.user_phone}</p>
						    <p style=" text-align:center; font-size:17px"><img src = "${pageContext.request.contextPath}/resources/img/address.png" style="width: 28px; height:28px;">&nbsp;&nbsp;${dto.user_address}</p>
						    <br>
						</div>
					 </c:forEach><br><br>
					 <c:forEach items="${pointlist}" var="pdto">
					    <div style="background-color:white; border-radius: 60px; width: 380px; display: block; margin: 0px auto;">
						    <br>
						    <p style=" text-align:center;"><img src = "${pageContext.request.contextPath}/resources/img/money.png" style="width: 40px; height:40px;"></p>
						    <h5 style=" text-align:center; font-size:18px; color:#EDA900;"> 보유 포인트 : ${pdto.point_current} P</h5>
						    <br>
						</div>
					 </c:forEach>
					 <c:forEach items="${pointlist}" var="pdto"><br><br>
					    <div style="background-color:white; border-radius: 60px; width: 650px; display: block; margin: 0px auto;"><br><br>
					    	<h4 style=" text-align:center; color:#4374D9; font-size:20px">최근 포인트 적립 / 결제 내역</h4><br>
						    <p style=" text-align:center; font-size:17px;"> 보유 포인트 : ${pdto.point_current} P</p>
						    <br>
						</div>
					 </c:forEach>
			    </section>
			 </div>
	    </header>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	</body>
</html>