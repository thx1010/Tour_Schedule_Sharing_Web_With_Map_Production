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
		        <div class="parent">
			        <div class="first">
			        	<!-- regdate 순서대로 정렬 -->
			        	<div class="scale"><a href="newlist"><img src = "resources/img/hot.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center;">NEW ! 지금 뜨는 코스</h5>
			        	<p style="text-align: center; font-size:14px; color:#878787; ">따끈따끈한 고퀄리티 로컬 정보 💛</p>
			        	<br><br><br>
			        </div>
			            <!-- 찜 갯수 순서대로 정렬 -->
			        <div class="second">
			        	<div class="scale"><a href="bestlist"><img src = "resources/img/sea.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center;">요즘 대세 코스</h5>
			        	<p style="text-align: center; font-size:14px; color:#878787; ">N0.1 Knows 먼저 알아가기</p>
			        	<br><br><br>
			        </div>
			        <div class="third">
			        	<div class="scale"><a href="randomlist" class="scale"><img src = "resources/img/plane.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></a></div> <br>
			        	<h5 style="text-align: center;">나에게 맞는 여행지 추천</h5>
			        	<p style="text-align: center; font-size:14px; color:#878787; ">내가 좋아하는 테마만 모아서 !</p>
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
						        <h4 class="modal-title" id="myModalLabel">No One Knows</h4>
						      </div>
						      <div class="modal-body">
						        <!-- 프로젝트 설명 -->
						        프로젝트 설명
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div></div>
			        </div>
			    </div><br><br><br>
			    <section class="container" style="margin-top: 10px;">
				    <div class="row" style="margin-left: 420px; margin-bottom: 60px;">
				    	<input type="text"  id="search" name="searchKeyword" required="required" value="" style="border-radius: 15%;" />&nbsp;&nbsp;
						<div class="tscale"><input type="submit" id="w-button-search" value="여행지 검색하기" style="background: linear-gradient( to left, #5587ED, #8BBDFF ); color:white; font-family: 'Do Hyeon'; border-radius: 15%;"/></div>
				    </div>
			    </section>
	            <div class="row text-center">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                        <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                         <div class="tscale"><img class="card-img-top" src="resources/img/sample.jpeg" alt="..." /></div>
                        <div class="card-body">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="#!">Find Out More!</a></div>
                    </div>
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