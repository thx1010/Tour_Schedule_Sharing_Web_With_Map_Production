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
<script type="text/javascript">
	$(document).ready(function(){
		selectContent();
		selectPermitContent();
		selectRejectContent();
	});
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminarticle/mapinfo', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}
	
	function selectPermitContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminarticle/permitcontent', 
		}).done(function( data ) {
		 	displayPermitContentList(data);
		});
	}
	
	function selectRejectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminarticle/rejectcontent', 
		}).done(function( data ) {
		 	displayRejectContentList(data);
		});
	}

	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['map_no'] + "</td>";
	    	mytable += "<td> " + val['map_title'] + "</td>";
	    	mytable += "<td> " + val['map_subtitle'] + "</td>";
	    	mytable += "<td> " + val['map_regdate'] + "</td>";
	    	mytable += "<td><button class='mapdetailButton' data-toggle='modal' data-target='#displaymapForm' myval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px;'>확인</button></td></tr>";
			});
	 
			$('#mapInfoDisplay').html(mytable);
			mapDetailEvent();
	}
	
	function displayPermitContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['map_no'] + "</td>";
	    	mytable += "<td> " + val['map_title'] + "</td>";
	    	mytable += "<td> " + val['map_subtitle'] + "</td>";
	    	mytable += "<td> " + val['map_regdate'] + "</td>";
	    	mytable += "<td><button class='mapdetailButton' data-toggle='modal' data-target='#displaymapForm' myval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px; '>확인</button></td></tr>";
			});
	 
			$('#mapPermitDisplay').html(mytable);
			mapDetailEvent();
	}
	
	function displayRejectContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['map_no'] + "</td>";
	    	mytable += "<td> " + val['map_title'] + "</td>";
	    	mytable += "<td> " + val['map_subtitle'] + "</td>";
	    	mytable += "<td> " + val['map_regdate'] + "</td>";
	    	mytable += "<td><button class='mapdetailButton' data-toggle='modal' data-target='#displaymapForm' myval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px; '>확인</button></td></tr>";
			});
	 
			$('#mapRejectDisplay').html(mytable);
			mapDetailEvent();
	}
	
	function mapDetailEvent() {
		$('.mapdetailButton').click(function(){
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/adminarticle/mapinfo/' + $(this).attr('myval')
			}).done(function( data ) {
				displayMapDetailList(data);
			});
		});
	}
	

	function displayMapDetailList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += "<br><h3 style='text-align: center'> " + val['map_title'] + "</h3>";
	  		mytable += "<h5 style='text-align: center'> " + val['map_subtitle'] + "</h5></br>";
	    	mytable += "<div style='text-align: center'><img src='${pageContext.request.contextPath}/resources/img/" + val['map_photo'] + "'/></div>";	
	    	mytable += "<br><p style='text-align: center'> " + val['map_country'] + "</p>";
	    	mytable += "<p style='text-align: center'> " + val['map_city'] + "</p>";
	    	mytable += "<p style='text-align: center'> " + val['map_content'] + "</p>";
	    	mytable += "<p style='text-align: center'> " + val['theme_name'] + "</p>";
	    	mytable += "<p style='text-align: center'> " + val['map_regdate'] + "</p>";
	    	mytable += "<p style='text-align: center'><button class='placedetailButton' myval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px; '>확인</button></p><br>";
			mytable += "<div id ='placeInfoDisplay' style='text-align: center'></div>";
			mytable += "<div class='row' style='margin-left: 333px'><button class='permitButton' permitval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px; ' data-dismiss='modal'>승인</button>&nbsp;&nbsp;";
			mytable += "<button class='rejectButton' rejectval='"+ val['map_no'] +"' style='background-color: white; border-radius: 10px; ' data-dismiss='modal'>반려</button></div>";
	  		});
	  		
			$('#displayMapList').html(mytable);
			placeDetailEvent();
			permitButtonEvent();
			rejectButtonEvent();
	}
	
	function placeDetailEvent() {
		$('.placedetailButton').click(function(){
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/adminarticle/mapinfo/placeinfo/' + $(this).attr('myval')
			}).done(function( data ) {
				displayPlaceDetailList(data);
			});
		});
	}
	
	function displayPlaceDetailList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += "<img src='${pageContext.request.contextPath}/resources/img/" + val['place_photo'] + "'/><br>";
	    	mytable += "<br><p> " + val['place_name'] + "</p>";
	    	mytable += "<p> " + val['place_addr'] + "</p>";	
	    	mytable += "<p> " + val['place_content'] + "</p><br>";
	  		});
	 
			$('#placeInfoDisplay').html(mytable);
			placeDetailEvent();
	}
	
	function permitButtonEvent() {
		$('.permitButton').click(function(){
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/adminarticle/mapinfo/permit/' + $(this).attr('permitval')
			}).done(function(data) {
				alert('게시물 등록이 승인되었습니다.');
				selectContent(); 
				selectPermitContent();
				selectRejectContent();
			});
		});
	}
	
	function rejectButtonEvent() {
		$('.rejectButton').click(function(){
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/adminarticle/mapinfo/reject/' + $(this).attr('rejectval')
			}).done(function(data) {
				alert('게시물 등록이 반려되었습니다.');
				selectContent(); 
				selectPermitContent();
				selectRejectContent();
			});
		});
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
                            <h6 class="m-0 font-weight-bold text-primary">게시글 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>게시글 번호</th>
                                            <th>제목</th>
                                            <th>부제목</th>
                                            <th>등록 날짜</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody id ="mapInfoDisplay">
                                     
                                    </tbody>
                                </table>
		                        <div class="modal fade" id = "displaymapForm" tabindex="-1" role="dialog" aria-labelledby="displayCategoryModalLabel">
							     	<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
										    <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											    <h4 class="modal-title" id="displayCategoryModalLabel"></h4>
	   								 	     </div>
										    <div class="modal-body" id="displayMapList">
										        
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
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: white">
                            <h6 class="m-0 font-weight-bold text-primary">승인 게시물 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>게시글 번호</th>
                                            <th>제목</th>
                                            <th>부제목</th>
                                            <th>등록 날짜</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody id ="mapPermitDisplay">
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: white">
                            <h6 class="m-0 font-weight-bold" style="color: red;">반려 게시물 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>게시글 번호</th>
                                            <th>제목</th>
                                            <th>부제목</th>
                                            <th>등록 날짜</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody id ="mapRejectDisplay">
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
		</section>
	    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
</html>