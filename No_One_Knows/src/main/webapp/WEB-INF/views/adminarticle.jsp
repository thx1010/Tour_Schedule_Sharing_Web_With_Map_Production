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
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		selectContent();
	});
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/adminarticle/mapinfo', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}

	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['map_no'] + "</td>";
	    	mytable += "<td> " + val['map_title'] + "</td>";
	    	mytable += "<td> " + val['map_subtitle'] + "</td>";
	    	mytable += "<td> " + val['map_regdate'] + "</td>";
	    	mytable += "<td><button class='mapdetailButton' data-toggle='modal' data-target='#displaymapForm' myval='"+ val['map_no'] +"' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;확인</h5></button></td></tr>";
			});
	 
			$('#mapInfoDisplay').html(mytable);
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
	    	mytable += "<p style='text-align: center'>맵 디테일 <br></p>";
	    	mytable += "<p style='text-align: center'>" + val['map_no'] + "<p/>";
	    	mytable += "<img src='${pageContext.request.contextPath}/resources/img/"  + val['map_photo'] + "'/>";	
	    	mytable += "<p> " + val['map_title'] + "</p>";
	    	mytable += "<p> " + val['map_country'] + "</p>";
	    	mytable += "<p> " + val['map_city'] + "</p>";
	    	mytable += "<p> " + val['map_subtitle'] + "</p>";
	    	mytable += "<p> " + val['map_content'] + "</p>";
	    	mytable += "<p> " + val['theme_name'] + "</p>";
	    	mytable += "<p> " + val['map_regdate'] + "</p>";
	    	mytable += "<p><button class='placedetailButton' myval='"+ val['map_no'] +"' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;확인</h5></button></p>";
			mytable += "<div id ='placeInfoDisplay'></div>";
			mytable += "<p><button class='permit' myval='"+ val['map_no'] +"' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;승인</h5></button></p>";
			mytable += "<p><button class='reject' myval='"+ val['map_no'] +"' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;반려</h5></button></p>";
	  		});
	 
			$('#displayMapList').html(mytable);
			placeDetailEvent();
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
	  		mytable += "<img src='${pageContext.request.contextPath}/resources/img/" + val['place_photo'] + "'/>";
	    	mytable += "<p> " + val['place_name'] + "</p>";
	    	mytable += "<p> " + val['place_addr'] + "</p>";	
	    	mytable += "<p> " + val['place_content'] + "</p>";
	  		});
	 
			$('#placeInfoDisplay').html(mytable);
			placeDetailEvent();
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
                </div>
		</section>
	    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
</html>