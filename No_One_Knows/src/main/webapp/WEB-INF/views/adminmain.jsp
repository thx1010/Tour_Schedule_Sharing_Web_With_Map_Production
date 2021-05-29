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

<!-- 파이 차트 -->
 <script type="text/javascript">
 window.onload = function () {
	
	 var myPieChart = new Chart("myPieChart", {
	   type: 'doughnut',
	   data: {
	     labels: ["Level1", "Level2", "Level3"],
	     datasets: [{
	       data: [${grade_first_partio}, ${grade_second_partio}, ${grade_third_partio}],
	       backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	       hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	       hoverBorderColor: "rgba(234, 236, 244, 1)",
	     }],
	   },
	   options: {
	     maintainAspectRatio: false,
	     tooltips: {
	       backgroundColor: "rgb(255,255,255)",
	       bodyFontColor: "#858796",
	       borderColor: '#dddfeb',
	       borderWidth: 1,
	       xPadding: 15,
	       yPadding: 15,
	       displayColors: false,
	       caretPadding: 10,
	     },
	     legend: {
	       display: false
	     },
	     cutoutPercentage: 80,
	   },
	 });
	 myPieChart.render();
 }

 </script>
 
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
	        <!-- Page Wrapper -->
		    <div id="wrapper">
		        <!-- Content Wrapper -->
		        <div id="content-wrapper" class="d-flex flex-column">
		
		            <!-- Main Content -->
		            <div id="content">
		                <!-- Begin Page Content -->
		                <div class="container-fluid">
		                    <!-- Content Row -->
		                    <div class="row">
		                        <div class="col-xl-3 col-md-6 mb-4">
		                            <div class="card border-left-primary shadow h-100 py-2" style="background-color: white">
		                                <div class="card-body" style="background-color: white">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="tscale"><a href="adminpoint" style="text-decoration: none"><div class="text-xs font-weight-bold text-primary mb-1">
		                                                거래 포인트 <br>Amount : </div></a></div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${pointaccount.point_current} P</div>
		                                        </div>
		                                        <div class="col-auto">
		                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <!-- Earnings (Monthly) Card Example -->
		                        <div class="col-xl-3 col-md-6 mb-4">
		                            <div class="card border-left-success shadow h-100 py-2" style="background-color: white">
		                                <div class="card-body" style="background-color: white">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="tscale"><a href="adminmember" style="text-decoration: none"><div class="text-xs font-weight-bold text-success mb-1">
		                                                회원 정보 <br>Members : </div></a></div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${membercount} 명</div>
		                                        </div>
		                                        <div class="col-auto">
		                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <!-- Earnings (Monthly) Card Example -->
		                        <div class="col-xl-3 col-md-6 mb-4">
		                            <div class="card border-left-info shadow h-100 py-2" style="background-color: white">
		                                <div class="card-body" style="background-color: white">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="tscale"><a href="adminarticle" style="text-decoration: none"><div class="text-xs font-weight-bold text-info mb-1">
		                                            게시글 관리 <br>Permission rate : 
		                                            </div></a></div>
		                                            <div class="row no-gutters align-items-center">
		                                                <div class="col-auto">
		                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">70%</div>
		                                                </div>
		                                                <div class="col">
		                                                    <div class="progress progress-sm mr-2">
		                                                        <div class="progress-bar bg-info" role="progressbar"
		                                                            style="width: 70%" aria-valuenow="50" aria-valuemin="0"
		                                                            aria-valuemax="100"></div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="col-auto">
		                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <!-- Pending Requests Card Example -->
		                        <div class="col-xl-3 col-md-6 mb-4">
		                            <div class="card border-left-warning shadow h-100 py-2" style="background-color: white">
		                                <div class="card-body" style="background-color: white">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="tscale"><a href="admincategory" style="text-decoration: none"><div class="text-xs font-weight-bold text-warning mb-1">
		                                                카테고리 관리 <br>Theme : </div></a></div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${categorycount} Type</div>
		                                        </div>
		                                        <div class="col-auto">
		                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		
		                    <!-- Content Row -->
		
		                    <div class="row">
		
		                        <!-- Area Chart -->
		                        <div class="col-xl-8 col-lg-7">
		                            <div class="card shadow mb-4">
		                                <!-- Card Header - Dropdown -->
		                                <div
		                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color: white;">
		                                    <h6 class="m-0 font-weight-bold text-primary">날짜별 회원 가입 비율</h6>
		                                    
		                                </div>
		                                <!-- Card Body -->
		                                <div class="card-body" style="height: 300px; background-color: white;">
		                                    <div class="chart-area" style="height: 250px;">
		                                        <canvas id="myAreaChart"></canvas>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <!-- Pie Chart -->
		                        <div class="col-xl-4 col-lg-5">
		                            <div class="card shadow mb-4">
		                                <!-- Card Header - Dropdown -->
		                                <div
		                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color: white;">
		                                    <h6 class="m-0 font-weight-bold text-primary">회원 등급 비율</h6>
		                                </div>
		                                <!-- Card Body -->
		                                <div class="card-body" style="height: 300px; background-color: white" >
		                                    <div class="chart-pie pt-4 pb-2" style="height: 200px;">
		                                        <canvas id="myPieChart"></canvas>
		                                    </div>
		                                    <div class="mt-4 text-center small">
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-primary"></i> Level 1
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-success"></i> Level 2
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-info"></i> Level 3
		                                        </span>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		
		                    <!-- Content Row -->
		                    <div class="row">
		
		                        <!-- Content Column -->
		                        <div class="col-lg-6 mb-4">
		
		                            <!-- Project Card Example -->
		                            <div class="card shadow mb-4" >
		                                <div class="card-header py-3"  style="background-color: white;">
		                                    <h6 class="m-0 font-weight-bold text-primary">Best 5 게시물</h6>
		                                </div>
		                                <div class="card-body" style="height:390px; background-color: white;"><br>
		                                    <h4 class="small font-weight-bold">[게시물 제목] <span
		                                            class="float-right"><img src = "resources/img/heart.png" style="width: 20px; height:20px;">&nbsp;20</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar" role="progressbar" style="width: 100%; background-color: #FFA7A7 "
		                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">[게시물 제목] <span
		                                            class="float-right"><img src = "resources/img/heart.png" style="width: 20px; height:20px;">&nbsp;18</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar" role="progressbar" style="width: 90%; background-color: #D9E5FF"
		                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">[게시물 제목] <span
		                                            class="float-right"><img src = "resources/img/heart.png" style="width: 20px; height:20px;">&nbsp;13</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar" role="progressbar" style="width: 75%; background-color: #D9E5FF"
		                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">[게시물 제목] <span
		                                            class="float-right"><img src = "resources/img/heart.png" style="width: 20px; height:20px;">&nbsp;11</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar" role="progressbar" style="width: 70%; background-color: #D9E5FF"
		                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">[게시물 제목] <span
		                                            class="float-right"><img src = "resources/img/heart.png" style="width: 20px; height:20px;">&nbsp;8</span></h4>
		                                    <div class="progress">
		                                        <div class="progress-bar" role="progressbar" style="width: 60%; background-color: #D9E5FF"
		                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <div class="col-lg-6 mb-4">
		
		                            <!-- Illustrations -->
		                            <div class="card shadow mb-4">
		                                <div class="card-header py-3" style="background-color: white;">
		                                    <h6 class="m-0 font-weight-bold text-primary">이용률 1위 회원</h6>
		                                </div>
		                                <div class="card-body" style="background-color: white;">
		                                    <div class="text-center">
		                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="height: 200px;"
		                                            src="resources/img/test.png">
		                                    </div>
		                                    <p style="text-align: center">회원 넘버</p>
		                                    <p style="text-align: center">회원 아이디</p>
		                                    <p style="text-align: center">게시물 등록 횟수</p>
		                                </div>
		                            </div> 
		                        </div>
		                    </div>
		                </div>		
			            </div>
			            <!-- End of Main Content -->
			        </div>
			        <!-- End of Content Wrapper -->
			    </div>
			    <!-- End of Page Wrapper -->
			</section>
	    </body>
	    
       	<!-- Bootstrap core JavaScript-->
	    <script src="resources/vendor/jquery/jquery.min.js"></script>
	    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	    <!--  Core plugin JavaScript-->
	    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	    
	    <!--Custom scripts for all pages-->
	    <script src="resources/js/sb-admin-2.min.js"></script>
	
	    <!--Page level plugins -->
	    <script src="resources/vendor/chart.js/Chart.min.js"></script>
	
	    <!--Page level custom scripts -->
	    <script src="resources/js/demo/chart-area-demo.js"></script>
        
        <script src="resources/js/scripts.js"></script>
</html>