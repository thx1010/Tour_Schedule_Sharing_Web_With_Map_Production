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
 <!-- Custom styles for this template-->
 <link href="resources/css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
</head>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="adminmain"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand" href="adminmain"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand" href="adminmain"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
<% 
	if(session.getAttribute("adminInfo") == null){ 
%>
	
            		<div class="hevent"><a class="navbar-brand" href="login" style="color:#BDBDBD; font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인</a></div>
            		<div class="hevent"><a class="navbar-brand" href="signup" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></div>
					<div class="hevent"><a class="navbar-brand" href="adminlogin" style="color:#6799FF; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자로 로그인</a></div>
<%
	} else {%>
					<p class="navbar-brand" style="color:#6799FF; font-size:14px">관리자 ${sessionScope.adminInfo.admin_id} 님 환영합니다!</p>
                    <div class="hevent"><a class="navbar-brand" href="logout" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
<% } %>
            	</div>
            </div>
        </nav><br><br>
      	
        <!-- Page Content-->
        <body id="page-top" style="background: linear-gradient( to bottom, white, rgba( 213, 213, 213, 0.1 ) );">
        <section class="container mt-3" style="max-width: 1000px;">
	       
		</section>
	    </body>
	    
       	<!— Bootstrap core JavaScript—>
	    <script src="resources/vendor/jquery/jquery.min.js"></script>
	    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	    <!— Core plugin JavaScript—>
	    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	    
	    <!— Custom scripts for all pages—>
	    <script src="resources/js/sb-admin-2.min.js"></script>
	
	    <!— Page level plugins —>
	    <script src="resources/vendor/chart.js/Chart.min.js"></script>
	
	    <!— Page level custom scripts —>
	    <script src="resources/js/demo/chart-area-demo.js"></script>
	    <script src="resources/js/demo/chart-pie-demo.js"></script>
        
        <script src="resources/js/scripts.js"></script>
</html>