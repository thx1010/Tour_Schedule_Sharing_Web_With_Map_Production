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
		       <div class="row">
                <!-- Blog entries-->
                <div class="col-md-8">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <img class="card-img-top" src="resources/img/sample.jpeg" alt="Card image cap" />
                        <div class="card-body" style="background-color: white">
                            <h2 class="card-title">Post Title</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="#!">Read More →</a>
                        </div>
                        <div class="card-footer text-muted" style="background-color: white">
                            Posted on January 1, 2021 by
                        </div>
                    </div>
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <img class="card-img-top" src="resources/img/sample.jpeg" alt="Card image cap" />
                        <div class="card-body" style="background-color: white">
                            <h2 class="card-title">Post Title</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="#!">Read More →</a>
                        </div>
                        <div class="card-footer text-muted" style="background-color: white">
                            Posted on January 1, 2021 by
                        </div>
                    </div>
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <img class="card-img-top" src="resources/img/sample.jpeg" alt="Card image cap" />
                        <div class="card-body" style="background-color: white">
                            <h2 class="card-title">Post Title</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="#!">Read More →</a>
                        </div>
                        <div class="card-footer text-muted" style="background-color: white">
                            Posted on January 1, 2021 by
                        </div>
                    </div>
                    <!-- Pagination-->
                    <ul class="pagination justify-content-center mb-4">
                        <li class="page-item"><a class="page-link" href="#!">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link" href="#!">Next</a></li>
                    </ul>
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
                        <h5 class="card-header" style="background-color: white">Categories</h5>
                        <div class="card-body" style="background-color: white">
                            <div class="row">
                                <div class="col-lg-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">Web Design</a></li>
                                        <li><a href="#!">HTML</a></li>
                                        <li><a href="#!">Freebies</a></li>
                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">JavaScript</a></li>
                                        <li><a href="#!">CSS</a></li>
                                        <li><a href="#!">Tutorials</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card my-4">
                        <h5 class="card-header" style="background-color: white">Side Widget</h5>
                        <div class="card-body" style="background-color: white">You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!</div>
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