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
            		<a class="navbar-brand"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
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
		
		                    <!-- Page Heading -->
		                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
		                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
		                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
		                    </div>
		
		                    <!-- Content Row -->
		                    <div class="row">
		
		                        <!-- Earnings (Monthly) Card Example -->
		                        <div class="col-xl-3 col-md-6 mb-4">
		                            <div class="card border-left-primary shadow h-100 py-2">
		                                <div class="card-body">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
		                                                Earnings (Monthly)</div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
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
		                            <div class="card border-left-success shadow h-100 py-2">
		                                <div class="card-body">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
		                                                Earnings (Annual)</div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
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
		                            <div class="card border-left-info shadow h-100 py-2">
		                                <div class="card-body">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
		                                            </div>
		                                            <div class="row no-gutters align-items-center">
		                                                <div class="col-auto">
		                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
		                                                </div>
		                                                <div class="col">
		                                                    <div class="progress progress-sm mr-2">
		                                                        <div class="progress-bar bg-info" role="progressbar"
		                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
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
		                            <div class="card border-left-warning shadow h-100 py-2">
		                                <div class="card-body">
		                                    <div class="row no-gutters align-items-center">
		                                        <div class="col mr-2">
		                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
		                                                Pending Requests</div>
		                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
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
		                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
		                                    
		                                </div>
		                                <!-- Card Body -->
		                                <div class="card-body"  style="height: 300px;">
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
		                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
		                                </div>
		                                <!-- Card Body -->
		                                <div class="card-body" style="height: 300px;">
		                                    <div class="chart-pie pt-4 pb-2" style="height: 200px;">
		                                        <canvas id="myPieChart"></canvas>
		                                    </div>
		                                    <div class="mt-4 text-center small">
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-primary"></i> Direct
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-success"></i> Social
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-info"></i> Referral
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
		                            <div class="card shadow mb-4">
		                                <div class="card-header py-3">
		                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
		                                </div>
		                                <div class="card-body" style="height:390px"><br>
		                                    <h4 class="small font-weight-bold">Server Migration <span
		                                            class="float-right">20%</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
		                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">Sales Tracking <span
		                                            class="float-right">40%</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
		                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">Customer Database <span
		                                            class="float-right">60%</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar" role="progressbar" style="width: 60%"
		                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">Payout Details <span
		                                            class="float-right">80%</span></h4>
		                                    <div class="progress mb-4">
		                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
		                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                    <h4 class="small font-weight-bold">Account Setup <span
		                                            class="float-right">Complete!</span></h4>
		                                    <div class="progress">
		                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
		                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
		                                    </div>
		                                </div>
		                            </div>
		
		                            <!-- Color System -->
		                            <div class="row">
		                                
		                            </div>
		
		                        </div>
		
		                        <div class="col-lg-6 mb-4">
		
		                            <!-- Illustrations -->
		                            <div class="card shadow mb-4">
		                                <div class="card-header py-3">
		                                    <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
		                                </div>
		                                <div class="card-body">
		                                    <div class="text-center">
		                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="height: 200px;"
		                                            src="img/undraw_posting_photo.svg" alt="...">
		                                    </div>
		                                    <p>Add some quality, svg illustrations to your project courtesy of <a
		                                            target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
		                                        constantly updated collection of beautiful svg images that you can use
		                                        completely free and without attribution!</p>
		                                </div>
		                            </div> 
		                        </div>
		                    </div>
		
		                </div>
		                <!-- /.container-fluid -->
		
			            </div>
			            <!-- End of Main Content -->
			        </div>
			        <!-- End of Content Wrapper -->
			    </div>
			    <!-- End of Page Wrapper -->
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