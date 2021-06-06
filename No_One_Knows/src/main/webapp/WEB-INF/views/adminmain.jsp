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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
textarea {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		border-radius: 8px;
		border: solid 1px;
		color: inherit;
		display: block;
		outline: 0;
		padding: 0 1em;
		text-decoration: none;
		width: 100%;
		padding: 0.75em 1em;
		background-color: rgba(255, 255, 255, 0.075);
		border-color: rgba(255, 255, 255, 0.35);
		border-color: #8cc9f0;
		box-shadow: 0 0 0 1px #8cc9f0;
	}
</style>
<!-- 파이 차트 -->
 <script type="text/javascript">
 window.onload = function () {
	
	 var myPieChart = new Chart("myPieChart", {
	   type: 'doughnut',
	   data: {
	     labels: ["초보 방랑가", "낭만 여행가", "여행 배테랑"],
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

 $(document).ready(function(){
	 noticeButtonEvent();
	});
	
 
 function noticeButtonEvent() {
		$('.noticebutton').click(function(){
			let notice = '${pageContext.request.contextPath}/adminmain/notice/'+ $("textarea#noticearea").val();
			$.ajax({
				method : 'GET',
				url : notice
			}).done(function( data ) {
				alert('공지사항이 등록되었습니다.');
				displayNotice(data);
				$("textarea#noticearea").val('');
			});
		});
	}
 
 function displayNotice(data) {
		var detailmodal = "";
	  	$.each( data, function( key, val ) {
	    	detailmodal += "<tr><td>"+ val['notice_no'] +"</td>";
	    	detailmodal += "<td>"+ val['notice_content'] +"</td>";
	    	detailmodal += "<td>"+ val['notice_date'] +"</td></tr>";
			});
	 
		$('#displaynoticearea').html(detailmodal);
	}
 </script>
 
</head>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row" style="margin-left: 80px; margin-top: 45px"><br><br>
            		<a class="navbar-brand" href="adminmain"><b><h3 style="font-size:25px; background: linear-gradient( to right, #1a3a83, #C4DEFF ); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">NO ONE KNOWS</h3></b></a>
            		
<% 
	if(session.getAttribute("adminInfo") == null){ 
%>
	
            		<div class="hevent"><a href="login"><h5 style="color:#1a3a83; font-size:13px;">로그인&nbsp;&nbsp;&nbsp;</h5></a></div>
            		<div class="hevent"><a href="signup"><h5 style="color:#1a3a83; font-size:13px">회원가입&nbsp;&nbsp;&nbsp;</h5></a></div>
					<div class="hevent"><a href="adminlogin"><h5 style="color:#1a3a83; font-size:13px">관리자로 로그인</h5></a></div>
<%
	} else {%>
					<h5 style="color:#1a3a83; font-size:13px">${sessionScope.adminInfo.admin_id} 님 환영합니다!&nbsp;&nbsp;&nbsp;</h5>
                    <div class="hevent"><a href="logout"><h5 style="color:#1a3a83; font-size:13px">로그아웃</h5></a></div>
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
		                                    <h6 class="m-0 font-weight-bold" style="color:#1a3a83;">날짜별 회원 가입 비율</h6>
		                                    
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
		                                    <h6 class="m-0 font-weight-bold" style="color:#1a3a83;">회원 등급 비율</h6>
		                                </div>
		                                <!-- Card Body -->
		                                <div class="card-body" style="height: 300px; background-color: white" >
		                                    <div class="chart-pie pt-4 pb-2" style="height: 200px;">
		                                        <canvas id="myPieChart"></canvas>
		                                    </div>
		                                    <div class="mt-4 text-center small">
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-primary"></i> 초보 방랑자
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-success"></i> 낭만 여행가
		                                        </span>
		                                        <span class="mr-2">
		                                            <i class="fas fa-circle text-info"></i> 여행 배테랑
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
		                                    <h6 class="m-0 font-weight-bold" style="color:#1a3a83;">관리자 공지 사항</h6>
		                                </div>
		                                <div class="card-body" style="height:390px; background-color: white;">
		                                    <div class="col-12">
													<textarea id="noticearea" placeholder="공지사항을 입력하세요" rows="4"></textarea>
												</div><br>
												<div class="col-12">
													<div style="text-align: center"><button class="noticebutton" style="background-color: white; border-radius: 10px" type="submit" class="primary">확인</button></div><br>
												</div>
		                                     <div style="overflow:scroll; height:150px;">
													<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
													<tbody id="displaynoticearea"></tbody>
			                         
			                                     </table>
											 </div>
		                                </div>
		                            </div>
		                        </div>
		
		                        <div class="col-lg-6 mb-4">
		
		                            <!-- Illustrations -->
		                            <div class="card shadow mb-4">
		                                <div class="card-header py-3" style="background-color: white;">
		                                    <h6 class="m-0 font-weight-bold" style="color:#1a3a83;">게시물 신고 현황</h6>
		                                </div>
		                                <div class="card-body" style="height:390px; background-color: white;">
		                                     <div style="overflow:scroll; height:350px;">
													<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
													<tbody>
													<tr>
													<td>게시물 [10] 부적합 판정 신고</td>
													</tr>
													<tr>
													<td>게시물 [80] 부적합 판정 신고</td>
													</tr>
													<tr>
													<td>게시물 [40] 부적합 판정 신고</td>
													</tr>
													<tr>
													<td>게시물 [45] 부적합 판정 신고</td>
													</tr>
													<tr>
													<td>게시물 [30] 부적합 판정 신고</td>
													</tr>
													</tbody>
			                                     </table>
											 </div>
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