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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		selectContent();
	});
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminmember/userinfo', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['user_no'] + "</td>";
	    	mytable += "<td> " + val['user_id'] + "</td>";
	    	mytable += "<td> " + val['user_name'] + "</td>";
	    	mytable += "<td>&nbsp;LEVEL " + val['grade_no'] + "</td>";
	    	mytable += "<td>&nbsp;" + val['grade_name'] + "</td>";
	    	mytable += "<td><select class='grade_no' name='grade_no' id='grade_no' style='height:30px; font-size:15px; border: 1px solid #ECEBFF; border-radius: 16%'>" +
			"<option value=''>-- 등급 --</option>" +
			"<option value='1'>LEVEL 1</option>" +
			"<option value='2'>LEVEL 2</option>" +
			    "<option value='3'>LEVEL 3</option>" +
			"</select>&nbsp;&nbsp;";
	    	mytable += "<button class='updateGradeButton' myval='" + val['user_no'] + "' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'/>&nbsp;변경</h5></button></td>";
	    	mytable += "<td><button class='userDetailButton' myval='" + val['user_no'] + "' data-toggle='modal' data-target='#userDetailModal'  style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;확인</h5></button></td>";
	    	mytable += "<td><button class='userOutButton' myval='" + val['user_no'] + "' style='background-color: #DE4F4F; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;진행</h5></button></td></tr>";
			});
	 
		$('#userContentDisplay').html(mytable);
		updateGradeButtonEvent();
		userDetailButtonEvent();
		userOutButtonEvent();
	}
	
	function userDetailButtonEvent() {
		$('.userDetailButton').click(function(){
			let user_no = '${pageContext.request.contextPath}/adminmember/userinfo/' + $(this).attr('myval'); 
			$.ajax({
				method : 'POST',
				url : user_no 
			}).done(function( data ) {
				displayUserDetailList(data);
			});
		});
	}
	
	function updateGradeButtonEvent() {
		$('.updateGradeButton').click(function(){
			let my_userid_val = '${pageContext.request.contextPath}/adminmember/altergrade/' + $(this).attr('myval'); 
			$.ajax({
				method : 'POST',
				url : my_userid_val,
				data : {grade_no : $('.grade_no').val()}
			}).done(function( data ) {
				alert('등급이 변경되었습니다.');
				displayContentList(data);
			});
		});
	}
	
	function userOutButtonEvent() {
		$('.userOutButton').click(function(){
			if (confirm('정말로 회원 탈퇴를 진행 하시겠습니까?')){
				let my_userid_val = '${pageContext.request.contextPath}/adminmember/out/' + $(this).attr('myval'); 
				$.ajax({
					method : 'DELETE',
					url : my_userid_val
				}).done(function( data ) {
					alert('회원 탈퇴가 완료되었습니다.');
					displayContentList(data);
				});
			  }
		});
	}
	
	function displayUserDetailList(data) {
		var detailmodal = "";
	  	$.each( data, function( key, val ) {
	    	detailmodal += "<p style='text-align: center'> " + "<img style='width: 50px; height: 50px' src='resources/img/" + val['user_photo'] + "'></p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_name'] + " ( " +  val['user_gender'] + " )" + "</p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_year'] +" . " + val['user_month'] +" . " + val['user_day'] + "</p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_email'] + "</p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_phone'] + "</p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_address'] + "</p>";
	    	detailmodal += "<p style='text-align: center'> " + val['user_joindate'] + "</p>";
			});
	 
		$('#displayUserDetail').html(detailmodal);
	}
	
	function displayUserTransactionList(data) {
		var transactionmodal = "";
	  	$.each( data, function( key, val ) {
	    	transactionmodal += "<tr><td> " + val['point_increase'] + "</td>";
	    	transactionmodal += "<td> " + val['point_charge_log'] + "</td>";
	    	transactionmodal += "<td> " + val['point_charge_date'] + "</td>";
	    	transactionmodal += "<td> " + val['point_decrease'] + "</td>";
	    	transactionmodal += "<td> " + val['point_spend_log'] + "</td>";
	    	transactionmodal += "<td> " + val['point_spend_date'] + "</td></tr>";
			});
	 
		$('#displayUserTransaction').html(transactionmodal);
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
	        <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: white">
                            <h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>회원 ID</th>
                                            <th>회원 이름</th>
                                            <th>등급 번호</th>
                                            <th>회원 등급</th>
                                            <th>등급 변경</th>
                                            <th>상세 정보</th>
                                            <th>강제 탈퇴</th>
                                        </tr>
                                    </thead>
                                    <tbody id="userContentDisplay">
                                       
                                    </tbody>
                                </table>
                                <!-- user detail Modal -->
	                             <div class="modal fade" id="userDetailModal" tabindex="-1" role="dialog" aria-labelledby="userDetailModalLabel">
							    	 <div class="modal-dialog" role="document">
									 <div class="modal-content">
									 <div class="modal-header">
										 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										 <h4 class="modal-title" id="userDetailModalLabel"></h4>
	   								 </div>
									 <div class="modal-body" id = "displayUserDetail">
									 
									  </div>
									  <div class="modal-footer">
									   		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								      </div>
									 </div>
									</div>
		                          </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
		</section>
	    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
</html>