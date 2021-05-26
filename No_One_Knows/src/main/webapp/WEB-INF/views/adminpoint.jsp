<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function displayUserList(data) {
		var detailmodal = "";
	  	$.each( data, function( key, val ) {
	  		//이 부분 수정
	    	detailmodal += "<tr><td> " + val['nickname'] + "</td>";
	    	detailmodal += "<td> " + val['idea'] + "</td>";
	    	detailmodal += "<td> " + val['memo'] + "</td>";
	    	detailmodal += "<td> " + val['email'] + "<span class='ui-icon ui-icon-closethick btnDeleteOk' myval='" + val['idea'] + "' style='cursor:pointer' />" + "</td></tr>";
			});
	 
		$('#displayUserDetail').html(mytable);
		myCommentEvent();
	}
	
	$(document).ready(function(){
			selectComment();
			$('#userdetailButton').click(function(){
				$.ajax({
					method : 'POST',
					url : '${pageContext.request.contextPath}/adminpoint/userdetail', 
					data : {userdetailno : $('#userdetailno').val()}
				}).done(function( data ) {
					displayUserList(data);
				});
			});
	});
	
	
	function selectComment() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminpoint/userdetail', 
		}).done(function( data ) {
		 	displayUserList(data);
		});
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
	        <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: white">
                            <h6 class="m-0 font-weight-bold text-primary">회원 포인트 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>회원 ID</th>
                                            <th>회원 이름</th>
                                            <th>현재 포인트</th>
                                            <th>상세 정보</th>
                                            <th>거래 정보</th>
                                            <th>이벤트 포인트</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="dto" items= "${userlist}">
	                                        <tr>
	                                            <td>${dto.user_no}</td>
	                                            <td>${dto.user_id}</td>
	                                            <td>${dto.user_name}</td>
	                                            <td>${dto.pointDTO.point_no}</td>
	                                            
	                                            <input type="hidden" value="${dto.user_no}" name="userdetailno" id="userdetailno">
	                                            <input type="hidden" value="${dto.user_no}" name="usertransactionno" id="usertransactionno">
	                                            <input type="hidden" value="${dto.user_no}" name="userpointno" id="userpointno">
	                                            <td><button  id="userdetailButton" data-toggle="modal" data-target="#userDetailModal" style="background-color: #8BBDFF; border-radius: 10px; color: white;"><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;확인</h5></button></td>
	                                            <td><button  id="usertransactionButton" data-toggle="modal" data-target="#userTransactionModal" style="background-color: #8BBDFF; border-radius: 10px; color: white;"><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;확인</h5></button></td>
	                                            <td><button id="userpointButton" style="background-color: #B1DB4E; border-radius: 10px; color: white;"><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;부여</h5></button></td>
	                                            <!-- user detail Modal -->
	                                            <div class="modal fade" id="userDetailModal" tabindex="-1" role="dialog" aria-labelledby="userDetailModalLabel">
												  <div class="modal-dialog" role="document">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="userDetailModalLabel"></h4>
												      </div>
												      <div class="modal-body" id = "displayUserDetail">
												        <!-- 프로젝트 설명 -->
														유저 디테일 출력 테스트
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
												      </div>
												    </div>
												  </div>
				                                </div>
				                                <!-- user transaction Modal -->
				                                <div class="modal fade" id="userTransactionModal" tabindex="-1" role="dialog" aria-labelledby="userTransactionModalLabel">
												  <div class="modal-dialog" role="document">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="userTransactionModalLabel"></h4>
												      </div>
												      <div class="modal-body" id = "displayUserTransaction">
												        <!-- 프로젝트 설명 -->
														유저 포인트 거래 출력 테스트
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
												      </div>
												    </div>
												  </div>
				                                </div>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <!-- End of Main Content -->
		</section>
	    </body>
	    
	      <!-- Bootstrap core JavaScript-->
	    <script src="vendor/jquery/jquery.min.js"></script>
	    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="js/sb-admin-2.min.js"></script>
	
	    <!-- Page level plugins -->
	    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
	    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	    <!-- Page level custom scripts -->
	    <script src="js/demo/datatables-demo.js"></script>
           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
</html>