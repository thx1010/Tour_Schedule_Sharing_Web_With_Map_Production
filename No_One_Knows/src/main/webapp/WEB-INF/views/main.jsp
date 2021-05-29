<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
 <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
</head>
<header class="header black-bg">
      <div class="nav notify-row" id="top_menu" style="margin-left: 150px; margin-top: 20px;">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-tasks"></i>
              <span class="badge bg-theme">4</span>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">카테고리 별로 구경하기</p>
              </li>
              <li>
              <!-- 첫번째 토글 -->
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Dashio Admin Panel</div>
                  </div>
                </a>
              </li>
              <li>
              <!-- 첫번째 토글 -->
                <a href="#">
                  <div class="task-info">
                    <div class="desc">Dashio Admin Panel</div>
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
              <span class="badge bg-warning">5</span>
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
			        	<div class="scale"><a href="newlist"><img src = "resources/img/hot.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center; color:#5D5D5D;">NEW ! 지금 뜨는 코스</h5>
			        	<!-- <p style="text-align: center; font-size:14px; color:#878787; ">따끈따끈한 고퀄리티 로컬 정보 💛</p> -->
			        	<br><br><br>
			        </div>
			            <!-- 찜 갯수 순서대로 정렬 -->
			        <div class="second">
			        	<div class="scale"><a href="bestlist"><img src = "resources/img/sea.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center; color:#5D5D5D;">요즘 대세 코스</h5>
			        	<!--<p style="text-align: center; font-size:14px; color:#878787; ">N0.1 Knows 먼저 알아가기</p> -->
			        	<br><br><br>
			        </div>
			        <div class="third">
			        	<div class="scale"><a href="randomlist" class="scale"><img src = "resources/img/plane.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center; color:#5D5D5D;">랜덤 여행지 추천</h5>
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
			        </div>
			    </div>
	            <div class="row text-center" >
                <div class="col-lg-3 col-md-6 mb-4" style="margin-top: 30px;">
                    <div class="card h-100">
                        <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body" style="background-color: white">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer" style="background-color: white"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4"  style="margin-top: 30px;">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body" style="background-color: white">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                        </div>
                        <div class="card-footer" style="background-color: white"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4"  style="margin-top: 30px;">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body" style="background-color: white">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer" style="background-color: white"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4"  style="margin-top: 30px;">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body" style="background-color: white">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                        </div>
                        <div class="card-footer" style="background-color: white"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                 <section class="container" style="margin-top: 10px;">
				    <div class="row" style="margin-left: 420px; margin-bottom: 60px;">
				    	<input type="text"  id="search" name="searchKeyword" required="required" value="" style="border-radius: 15%;" />&nbsp;&nbsp;
						<div class="tscale"><input type="submit" id="w-button-search" value="여행지 검색하기" style="background: linear-gradient( to left, #5587ED, #8BBDFF ); color:white; font-family: 'Do Hyeon'; border-radius: 15%;"/></div>
				    </div>
			    </section>
            </div>
        </div>
	    </div>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>