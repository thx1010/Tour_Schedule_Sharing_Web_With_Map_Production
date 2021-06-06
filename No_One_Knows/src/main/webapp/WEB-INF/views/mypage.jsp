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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

<link
   rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
/>
 <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
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
<style>
.navbar-brand, h1, h2, h3, h4, h5{
	font-family: 'Do Hyeon';
}
</style>
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
      	
       <!-- Wrapper -->
			<div id="wrapper"><br><br><br>
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#intro" class="active">개인 정보</a></li>
							<li><a href="#first">거래 정보</a></li>
							<li><a href="#second">등록 게시물 현황</a></li>
							<li><a href="#third">구매한 게시물</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Introduction -->
							<section id="intro" class="main">
								<div class="spotlight">
									<div class="content">
										<header class="major">
											<span class="logo"><img src = "${pageContext.request.contextPath}/resources/img/${sessionScope.userInfo.user_photo}" style="width: 80px; height: 80px; display: block; margin: 0px auto;"></span>
										</header>
										<section style="margin-top: 40px">
											<div class="table-wrapper">
												<table>
													<thead>
														<tr>
															<th><h3 style="font-size: 17px; color: #5586EB">레벨</h3></th>
															<th><h3 style="font-size: 17px">이름(나이)</h3></th>
								 							<th><h3 style="font-size: 17px">생년월일</h3></th>
															
														</tr>
													</thead>
													<tbody>
														<tr>
														<c:forEach items="${userlist}" var="dto">
															<td style="color: #5586EB">Level. ${dto.gradeDTO.grade_no}&nbsp;&nbsp;  ${dto.gradeDTO.grade_name}</td>
															<td>${dto.user_name}  (${dto.user_gender})</td>
															<td>${dto.user_year} . ${dto.user_month} . ${dto.user_day}</td>
															
														 </c:forEach>
														</tr>
													</tbody>
													</table>
													<table style="margin-top: 30px">
													<thead>
														<tr>
														
															<th><h3 style="font-size: 17px">이메일</h3></th>
															<th><h3 style="font-size: 17px">휴대 전화</h3></th>
															<th><h3 style="font-size: 17px">주소</h3></th>
														</tr>
													</thead>
													<tbody>
														<tr>
														<c:forEach items="${userlist}" var="dto">
															
															<td>${dto.user_email}</td>
															<td>${dto.user_phone}</td>
															<td>${dto.user_address}</td>
														 </c:forEach>
														</tr>
													</tbody>
													</table>
											</div>
										</section>
										
									</div>
								</div>
							</section>

						<!-- First Section -->
							<section id="first" class="main special">
							<c:forEach items="${pointlist}" var="pdto">
								<header class="major">
									<h2>보유 포인트 : ${pdto.point_current} P</h2>
								</header>
							</c:forEach>
								<table>
													<h2>[포인트 충전 기록]</h2>
													<thead>
														<tr>
															<th><h3 style="font-size: 17px;">번호</h3></th>
															<th><h3 style="font-size: 17px">충전 금액</h3></th>
								 							<th><h3 style="font-size: 17px">충전 로그</h3></th>
								 							<th><h3 style="font-size: 17px">충전 일시</h3></th>
															
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${pointchargelist}" var="dto">
														<tr>
															<td>${dto.point_charge_no}</td>
															<td>${dto.point_increase}</td>
															<td>${dto.point_charge_log}</td>
															<td>${dto.point_charge_date}</td>
														</tr>
													</c:forEach>
													</tbody>
													</table><br><br>
													<table style="margin-top: 30px">
													<h2>[포인트 소비 기록]</h2>
													<thead>
														<tr>
															<th><h3 style="font-size: 17px;">번호</h3></th>
															<th><h3 style="font-size: 17px;">소비 금액</h3></th>
								 							<th><h3 style="font-size: 17px;">소비 로그</h3></th>
								 							<th><h3 style="font-size: 17px;">소비 일시</h3></th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${pointspendlist}" var="dto">
														<tr>
															<td>${dto.point_spend_no}</td>
															<td>${dto.point_decrease}</td>
															<td>${dto.point_spend_log}</td>
															<td>${dto.point_spend_date}</td>
														</tr>
													 </c:forEach>
													</tbody>
													</table>
							</section>

						<!-- Second Section -->
							<section id="second" class="main special">
								<table style="margin-top: 30px">
													<h2>[등록 게시물 현황]</h2>
													<thead>
														<tr>
															<th><h3 style="font-size: 17px;">번호</h3></th>
															<th><h3 style="font-size: 17px;">게시물 제목</h3></th>
								 							<th><h3 style="font-size: 17px;">등록 날짜</h3></th>
								 							<th><h3 style="font-size: 17px;">관리자 승인 여부</h3></th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${mapstatuslist}" var="dto">
														<tr>
<c:choose>
	<c:when test="${dto.map_name eq '승인'}">
															<td><p style="color: #5586EB">${dto.map_no}</p></td>
															<td><p style="color: #5586EB"><a href="/board/mapcontrol/coursedraw/${dto.map_no}">${dto.map_title}</a></p></td>
															<td><p style="color: #5586EB">${dto.map_regdate}</p></td>
															<td><p style="color: #5586EB">${dto.map_name}</p></td>
 	</c:when>
 	<c:when test="${dto.map_name eq '반려'}">
 															<td><p style="color: #BC2424">${dto.map_no}</p></td>
															<td><p style="color: #BC2424">${dto.map_title}</p></td>
															<td><p style="color: #BC2424">${dto.map_regdate}</p></td>
															<td><p style="color: #BC2424">${dto.map_name}</p></td>
 	</c:when>
 	<c:otherwise>
 															<td>${dto.map_no}</td>
															<td>${dto.map_title}</td>
															<td>${dto.map_regdate}</td>
															<td><p>${dto.map_name}</p></td>
 	</c:otherwise>
</c:choose>
														</tr>
													 </c:forEach>
													</tbody>
													</table>
							</section>
							
							<!-- third section -->
							<section id="third" class="main special">
								<table style="margin-top: 30px">
													<h2>[구매한 게시글]</h2>
													<thead>
														<tr>
															<th><h3 style="font-size: 17px;">번호</h3></th>
															<th><h3 style="font-size: 17px;">게시글 제목</h3></th>
								 							<th><h3 style="font-size: 17px;">구매 날짜</h3></th>
														</tr>
													</thead>
													<tbody>
													<!-- 여기 수정 -->
													<c:forEach items="${mappurchaselist}" var="dto">
														<tr>
															<td>${dto.map_no}</td>
															<td>${dto.map_title}</td>
															<td>${dto.purchase_regdate}</td>
														</tr>
													 </c:forEach>
													</tbody>
													</table>
							</section>
					</div><br><br><br>
			</div>
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/s/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	</body>
</html>