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
			url : '${pageContext.request.contextPath}/admincategory/categoryinfo', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}

	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += "<tr><td> " + val['theme_no'] + "</td>";
	    	mytable += "<td> " + val['theme_name'] + "</td>";
	    	mytable += "<td> " + val['theme_content'] + "</td>";
	    	mytable += "<td><button class='updateButton' data-toggle='modal' data-target='#displayUpdateForm' updateval='"+ val['theme_no'] +"' style='background-color: #8BBDFF; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;확인</h5></button></td>";
	    	mytable += "<td><button class='deleteCategoryButton' deleteval='" + val['theme_no'] + "' style='background-color: #DE4F4F; border-radius: 10px; color: white;'><h5><img src = 'resources/img/check.png' style='width: 20px; height:20px;'>&nbsp;삭제</h5></button></td></tr>";
			});
	 
			$('#categoryInfoDisplay').html(mytable);
			newCategoryButtonEvent();
			updateCategoryEvent();
			deleteCategoryEvent();
	}
	
	function newCategoryButtonEvent() {
		displayCategoryInsertList();
		$('.newCategoryButton').click(function(){ 
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/admincategory/newcategory',
				data : {theme_name : $('.theme_name').val(), theme_content : $('.theme_content').val()}
			}).done(function( data ) {
				alert('새로운 카테고리가 추가되었습니다.');
				displayContentList(data)
			});
		});
	}
	
	function updateCategoryEvent() {
		displayCategoryUpdateList();
		$('.updateCategoryButton').click(function(){
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/admincategory/updatecategory',
				data : {theme_no : $('.updateButton').attr('updateval'), theme_name : $('.theme_update_name').val(), theme_content : $('.theme_update_content').val()}
			}).done(function( data ) {
				alert('카테고리 컨텐츠가 변경되었습니다.');
				displayContentList(data);
			});
		});
	}
	
	function deleteCategoryEvent() {
		$('.deleteCategoryButton').click(function(){
			if (confirm('정말로 카테고리를 삭제 하시겠습니까?')){
				//내부 컨텐츠들이 모두 삭제된다는 경고 띄우기
				let my_userid_val = '${pageContext.request.contextPath}/admincategory/deletecategory/' + $(this).attr('deleteval'); 
				$.ajax({
					method : 'DELETE',
					url : my_userid_val
				}).done(function( data ) {
					alert('카테고리 삭제가 완료되었습니다.');
					displayContentList(data);
				});
			  }
		});
	}
	
	function displayCategoryUpdateList() {
		var detailmodal = "";
	  	detailmodal += "<p style='text-align: center'>카테고리 수정 <br></p>";
	  	detailmodal += "<p style='text-align: center'>테마 카테고리 이름 : <input class='theme_update_name' type='text' style='border-radius: 5px; width: 150px' /></p><br>";
	  	detailmodal += "<p style='text-align: center'>테마 카테고리 설명 : <input class='theme_update_content' type='text' style='border-radius: 5px; width: 150px' /></p><br>";
	  	detailmodal += "<p style='text-align: center'><button type='button' class='updateCategoryButton' data-dismiss='modal'>확인</button></p>";
		$('#displayUpdateList').html(detailmodal);
	}
	//여기 updateval 수정
	
	function displayCategoryInsertList() {
		var detailmodal = "";
	  	detailmodal += "<p style='text-align: center'>카테고리 추가 <br></p>";
	  	detailmodal += "<p style='text-align: center'>테마 카테고리 이름 : <input class='theme_name' type='text' style='border-radius: 5px; width: 150px' /></p><br>";
	  	detailmodal += "<p style='text-align: center'>테마 카테고리 설명 : <input class='theme_content' type='text' style='border-radius: 5px; width: 150px' /></p><br>";
	  	detailmodal += "<p style='text-align: center'><button type='button' class='newCategoryButton'  data-dismiss='modal'></p>";
		$('#displayCategoryList').html(detailmodal);
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
                            <h6 class="m-0 font-weight-bold text-primary">테마 카테고리 관리</h6>
                        </div>
                        <div class="card-body" style="background-color: white">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <button data-toggle='modal' data-target='#displayCategoryForm' style="background-color: #8BBDFF; border-radius: 10px; color: white; margin-bottom: 20px;"><h5><img src = "resources/img/check.png" style="width: 20px; height:20px;">&nbsp;새로운 카테고리 생성</h5></button>
                                    <thead>
                                        <tr>
                                            <th>카테고리 번호</th>
                                            <th>카테고리 이름</th>
                                            <th>카테고리 설명</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody id ="categoryInfoDisplay">
                                     
                                    </tbody>
                                </table>
                                <!-- 카테고리 추가 모달 -->
                                <div class="modal fade" id = "displayCategoryForm" tabindex="-1" role="dialog" aria-labelledby="displayCategoryModalLabel">
							     	<div class="modal-dialog" role="document">
										<div class="modal-content">
										    <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											    <h4 class="modal-title" id="displayCategoryModalLabel"></h4>
	   								 	     </div>
										    <div class="modal-body" id="displayCategoryList">
										        
										    </div>
										    <div class="modal-footer">
										        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										   </div>
										</div>
									</div>
		                        </div> 
		                        <div class="modal fade" id = "displayUpdateForm" tabindex="-1" role="dialog" aria-labelledby="displayCategoryModalLabel">
							     	<div class="modal-dialog" role="document">
										<div class="modal-content">
										    <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											    <h4 class="modal-title" id="displayCategoryModalLabel"></h4>
	   								 	     </div>
										    <div class="modal-body" id="displayUpdateList">
										        
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