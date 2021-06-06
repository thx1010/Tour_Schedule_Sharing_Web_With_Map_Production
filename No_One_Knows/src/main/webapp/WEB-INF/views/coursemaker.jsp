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


<link
   rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
/>

 <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
 <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
 <noscript><link rel="stylesheet" href="resources/css/noscript.css" /></noscript>
 
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
<header class="header" style=" background-color: white">
      <div class="nav notify-row" id="top_menu" style="margin-left: 150px;">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-tasks"></i>
 <% 
	if(session.getAttribute("userInfo") == null){ 
%>
<% 
	} else {
%>
              <span class="badge bg-theme" id="messagecount"></span>
<% 
	}
%>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              
              <li>
                <a href="#notice">
                  <div class="task-info">
                    <div class="desc"><h5>공지 사항 확인하기</h5></div>
                  </div>
                </a>
              </li>
            </ul>
          </li>
          <!-- settings end -->
          <!-- 두번째 토글-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-envelope-o"></i>
              <span class="badge bg-warning">${noticecount.notice_no}</span>
          </a>
            <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              
              <li>
              <div id = "displaymessagelist">
              
              </div>
              </li>
            </ul>
          </li>
          <!-- inbox dropdown end -->
          <!-- notification dropdown start-->
          <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-bell-o"></i>
     
              </a>
            <ul class="dropdown-menu extended notification">
              <div class="notify-arrow notify-arrow-yellow"></div>
              <c:forEach items="${noticelist}" var="dto">
              <li>
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  <p style="font-size: 12px">${dto.notice_content}</p>
              </li>
              </c:forEach>
            </ul>
          </li>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
    </header>


	<body>
        <nav class="navbar">
            <div class="container"  style="margin-top: 95px;">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; background: linear-gradient( to right, white, #C4DEFF ); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">NO ONE KNOWS</h3></b></a>
            		
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a href="login"><h5 style="color:#E8FFFF; font-size:13px;">로그인</h5></a></div>
            		<div class="hevent"><a href="signup"><h5 style="color:#E8FFFF; font-size:13px">회원가입</h5></a></div>
					<div class="hevent"><a href="adminlogin"><h5 style="color:#E8FFFF; font-size:13px">관리자로 로그인</h5></a></div>
<%
	} else {%>
					<h5 style="color:#E8FFFF; font-size:13px">${sessionScope.userInfo.user_id} 님 환영합니다!</h5>
                    <div class="hevent"><a href="logout"><h5 style="color:#E8FFFF; font-size:13px">로그아웃</h5></a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a href="likepage" style="color:white; font-size:14px;"><img src = "resources/img/heart2.png" style="width: 18px; height:18px;">&nbsp;&nbsp;내가 찜한 코스</a></div>
            		<div class="tscale"><a href="cartpage" style="color:white; font-size:14px"><img src = "resources/img/cart.png" style="width: 18px; height:18px;">&nbsp;&nbsp;장바구니</a></div>
                    <div class="tscale"><a href="mypage/${sessionScope.userInfo.user_no}" style="color:white; font-size:14px"><img src = "resources/img/info.png" style="width: 18px; height:18px;">&nbsp;&nbsp;마이페이지</a></div>
                    <div class="tscale"><a href="coursemaker" style="color:white; font-size:14px"><img src = "resources/img/check.png" style="width: 18px; height:18px;">&nbsp;&nbsp;여행코스 만들기</a></div>
            		<div class="tscale"><a href="chatroom" style="color:white; font-size:14px"><img src = "resources/img/chat.png" style="width: 20px; height:20px;">&nbsp;&nbsp;커뮤니티</a></div>
            	</div>
            </div>
        </nav>
        <!-- Page Content-->
   		 <div id="wrapper"><br><br><br>
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#top" class="active">TOP</a></li>
							<li><a href="#bottom">BOTTOM</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
							<section class="main">
								<a id="top"></a>
									 <section class="container">
									 	<div class="card">
								                <div class="card-header card-header-primary" style="background-color: white">
								                    <h4 class="card-title" style="color:#6799FF; font-size: 20px"> 기본 정보 입력</h4>
								                    <p class="card-catagory"></p>
								                </div>
								                <div class="card-body" style="background-color: white">
								                    <div class="table-responsive">
								                        <table class="table">
								                            <tbody>
								                            <tr>
								                                <td>
								                                	<label><h5 style="font-size: 17px">여행 제목</h5></label>
								                                    <input type="text" id="map_title" name="map_title" class="form-control">
								                                </td>                        
								                            </tr>
								                            <tr>
								                                <td>
								                                	<label><h5 style="font-size: 17px">부제</h5></label>
								                                    <input type="text" id="map_subtitle" name="map_subtitle" class="form-control">                                    
								                                </td>
								                            </tr>  
								                            <tr>
								                                <td>
								                                	<div class="form-row">
																	<div class="form-group col-sm-6">
																			<label><h5 style="font-size: 17px">국가</h5></label>
																			<input type="text" id="map_country" name="map_country" class="form-control" maxlength=20>
																	</div>
																	<div class="form-group col-sm-6">
																			<label><h5 style="font-size: 17px">테마 카테고리</h5></label>
																			<select id="theme_no" name="theme_no" class="form-control">
																      			<c:forEach var="theme" items='${themeList}'>
																      				<option value="${theme.theme_no}">${theme.theme_name}</option>
																      			</c:forEach>
																      		</select>
																	</div>
																	</div>                                    
								                                </td>
								                            </tr>
								                            <tr>
								                                <td>
								                                	<div class="form-row">
																	<div class="form-group col-sm-6">
																			<label><h5 style="font-size: 17px">주</h5></label>
																			<input type="text"  id="map_state" name="map_state" class="form-control" maxlength=20>
																	</div>
																	<div class="form-group col-sm-6">
																			<label><h5 style="font-size: 17px">도시</h5></label>
																			<input type="text" id="map_city" name="map_city" class="form-control" maxlength=20>
																	</div>
																	</div>                                    
								                                </td>
								                            </tr>
								                            <tr>
								                                <td>
								                                    <div class="form-group">
																		<label><h5 style="font-size: 17px">내용</h5></label>
																		<textarea  id="map_content" name="map_content" class="form-control" maxlength="500" style="height:180px;"></textarea>
																	</div>                            
								                                </td>
								                            </tr>
								                            </tbody>
								                        </table>
								                    </div>
								                </div>
								            </div>
								        </div><br><br>
								        <div class="col-sm-12 pt-3">
								            <div class="card">
								                <div class="card-header card-header-primary" style="background-color: white">
								                    <h4 class="card-title" style="color:#6799FF; font-size: 20px"> 썸네일 등록</h4>
								                    <p class="card-catagory"></p>
								                </div>
								                <div class="card-body" style="background-color: white">
								                    <div class="table-responsive">
								                        <table class="table">
								                            <tbody>
								                            <tr>
								                                <td>
								                                   <div class="filebox preview-image"><br><br>
																	  <input class="upload-name" value="파일선택" disabled="disabled" >
																	
																	  <label for="map_photo" class="bs3-primary">업로드</label> 
																	  <input type="file" name="map_photo" id="map_photo" class="upload-hidden" style="opacity: 0.0"> 
																	</div>
								                                </td>                        
								                            </tr>
								                            </tbody>
								                        </table>
								                    </div>
								                </div>
								            </div>
								        </div><br><br>
								        <div class="col-sm-12 pt-3">
								            <div class="card">
								                <div class="card-header card-header-primary" style="background-color: white">
								                    <h4 class="card-title" style="color:#6799FF; font-size: 20px"> 코스 정보 입력</h4>
								                    <p class="card-catagory"></p>
								                </div>
								                <div class="card-body" style="background-color: white">
								                    <div class="table-responsive">
								                        <table class="table">
								                            <tbody>
								                            <tr>
								                                <td>
								                                  <div id="map" style="width: 100%; height: 400px;"></div>
								                                  <div><br>
															        	<p>
															        		<button onclick="selectOverlay('ARROW')" style="background-color:#EBF7FF; border-radius: 15px"><p style="color: #626262; font-size: 15px;">화살표</p></button>
																		    <button onclick="selectOverlay('POLYLINE')" style="background-color:#EBF7FF; border-radius: 15px"><p style="color: #626262; font-size: 15px;">선</p></button>
																		    <button onclick="selectOverlay('CIRCLE')" style="background-color: #EBF7FF; border-radius: 15px"><p style="color: #626262; font-size: 15px;">원</p></button>
																		    <button onclick="selectOverlay('RECTANGLE')" style="background-color:#EBF7FF; border-radius: 15px"><p style="color: #626262; font-size: 15px;">사각형</p></button>
																		    <button onclick="getDataFromDrawingMap()" style="background-color:#EBF7FF; border-radius: 15px"><p style="color: #626262; font-size: 15px;">가져오기</p></button>
																		</p>
														        	</div>
								                                </td>                        
								                            </tr>
								                            <tr>
								                                <td>
								                                  <div class="form-group">
																		<div id="divRoute">
														        		<div id="divRouteForm_order"></div>
														        		<div id="divRouteForm_name"></div>
														        		<div id="divRouteForm_type"></div>
														        		<div id="divRouteForm_content"></div>
								        								<div id="divRouteForm_delete"></div>
				        							  </div>
										        					<div id="divPlace">
															        	<div id="divPlaceForm_order"></div>
																		<div id="divPlaceForm_name"></div>
																		<div id="divPlaceForm_loadaddr"></div>
																		<div id="divPlaceForm_addr"></div>
																		<div id="divPlaceForm_lat"></div>
																		<div id="divPlaceForm_lng"></div>
																		<div id="divPlaceForm_image"></div>
																		<div id="divPlaceForm_content"></div>
																		<div id="divPlaceForm_photo"></div>
																		<div id="divPlaceForm_delete"></div>
																	</div>
																  </div> 
								                                </td>                        
								                            </tr>
								                            </tbody>
								                        </table>
								                    </div>
								                </div>
								            </div>
								        </div>
						 
									    <div class="text-center mt-3">
									        <button type="button" onclick="makeCourse()"  style="background-color: white;"><p style= "color:#626262;">지도 만들기</p></button>
									        <a href="main" style="text-decoration: none"><button type="button" style="background-color: white;"><p style= "color: #626262;">돌아가기</p></button></a><br><br>
									    </div><br><br>
							        </div>
									</section>
								<a id="bottom"></a>
							</section>
					</div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f99123b49282be7b5dcbc9dbff6f616&libraries=services,drawing">
	</script>
	<script>
		//preview image 
	    var imgTarget = $('.preview-image .upload-hidden');
	    var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
	    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
	    startOption = { 
	        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
	    
	    var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
	    arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
	    arriveOption = { 
	        offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
	    
	    var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
	    var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
	    
	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();
	
	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }
	
	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	
	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	</script>
	
	<script>
		var placeCount = 0;
		var routeCount = 0;
		// 지도에 표시된 마커 객체를 가지고 있을 배열
		var markers = [];
		var markerInfos = [];
		//var route = [];
		var lineInfos = [];
		var routeInfos = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57594644036231, 126.97685536561725), // 지도의 중심좌표(광화문)
			level : 11
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//controller
		var mapTypeControl = new kakao.maps.MapTypeControl();
		var zoomControl = new kakao.maps.ZoomControl();
		
		var options = {
				map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			    drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
			    	kakao.maps.Drawing.OverlayType.ARROW,
			        kakao.maps.drawing.OverlayType.POLYLINE,
			        kakao.maps.drawing.OverlayType.RECTANGLE,
			        kakao.maps.drawing.OverlayType.CIRCLE
			    ],
			    // 사용자에게 제공할 그리기 가이드 툴팁입니다
			    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
			    guideTooltip: ['draw', 'drag', 'edit'],
			    arrowOptions: {
			    	draggable: true,
			    	removable: false,
			    	editable: true,
			    	strokeColor: '#39f',
			    	hintStrokeStyle: 'dash'
			    },
			    polylineOptions: { // 선 옵션입니다
			        draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
			        removable: false, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
			        editable: true, // 그린 후 수정할 수 있도록 설정합니다 
			        strokeColor: '#39f', // 선 색
			        hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
			        hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
			    },
			    rectangleOptions: {
			        draggable: true,
			        removable: false,
			        editable: true,
			        strokeColor: '#39f', // 외곽선 색
			        fillColor: '#39f', // 채우기 색
			        fillOpacity: 0.5 // 채우기색 투명도
			    },
			    circleOptions: {
			        draggable: true,
			        removable: false,
			        editable: true,
			        strokeColor: '#39f',
			        fillColor: '#39f',
			        fillOpacity: 0.5
			    }
		};
		
		var manager = new kakao.maps.drawing.DrawingManager(options);
		
		
		//drawing event
		manager.addListener('drawstart', function(mouseEvent) {
			
			//draw start log
		    console.log('drawstart', mouseEvent.overlayType);
		});
		
		manager.addListener('drawend', function(data) {
			//draw end log
			console.log(data);
		    console.log(data.overlayType);
		    console.log(data.coords.La);
		    kakao.maps.event.addListener(map, 'click', mapClickHandler);
		    
		    var lineInfo = {
		    		"obj" : data.target,
	   				"route_course_no" : routeCount++,
	   				"route_name" : '',
	   				"route_type" : data.overlayType, //polyLine or arrow
	   				"route_path" : '',
	   				"route_content" : '',
	   				"route_option" : '',
	   				"route_idf_La" : data.coords.La,
	   				"route_idf_Ma" : data.coords.Ma
	   			
	   		};
		    lineInfos.push(lineInfo);
		    displayRouteEditor(lineInfo);
		    addRouteClickEvent(lineInfo);
		    

		});
		
		
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		map.addControl(zoomControl, kakao.maps.ControlPosition.Right);
		
		
		
		
		//맵 클릭 이벤트 추가 : 동적마커생성
		
		

		
		var mapClickHandler = function(mouseEvent) {
			if(confirm("마커를 찍으시겠습니까?") == true) {
				
			} else {
				return;
			}
			var newPosition = mouseEvent.latLng;
			var detailLoadAddr;
			var detailAddr;
			
			var markerInfo = addMarker(newPosition);
			
			(async() => {
				let response = await searchDetailAddrFromCoords(newPosition, function(result, status) {
					if(status == kakao.maps.services.Status.OK) {
						detailLoadAddr = !!result[0].road_address ? result[0].road_address.address_name : '';
			            detailAddr = result[0].address.address_name;
			            
						//placeAddr1.push(detailLoadAddr);
						//placeAddr2.push(detailAddr);
						
						markerInfo.place_loadaddr = detailLoadAddr;
						markerInfo.place_addr = detailAddr;
						
						markerInfos.push(markerInfo);
						displayMarkerEditor(markerInfo);
						//console.log(markerInfo);
						console.log("도로명 : " + detailLoadAddr);
						console.log("지번 : " + detailAddr);
					}
				});
			})();
			
			
		};
		
		kakao.maps.event.addListener(map, 'click', mapClickHandler);
		
		
	
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		
		//마커생성 메서드
		function addMarker(position) {
			
		 	var marker = new kakao.maps.Marker({
		 		position: position,
		 		draggable: true,
		 		clickable:true
		 	});
		 	
		 	marker.setMap(map);
		 	markers.push(marker);
		 	
		 	if(markers.length > 1) {
		 		markers[0].setImage(startImage);
		 		for(var idx=1; idx<markers.length-1; idx++) {
		 			markers[idx].setImage(null);
		 		}
		 		markers[markers.length-1].setImage(arriveImage);
		 	}
		 	
		 	
		 	var markerInfo = {
		 			"obj": marker,
		 			"place_course_no": placeCount++,
		 			"place_name": '',
		 			"place_lat": marker.getPosition().getLat(),
		 			"place_lng": marker.getPosition().getLng(),
		 			"place_name": '',
		 			"place_loadaddr": '',
		 			"place_addr": '',
		 			"place_content": '',
		 			"place_photo": '',
		 			"created": false
		 	};
		 	
		 	//markerInfos.push(markerInfo);
		 	//console.log(markerInfo.lat);
		 	//console.log(markerInfo.lng);
		 	
		 	addMarkerClickEvent(markerInfo);
		 	addMarkerDragEvent(markerInfo);
		 	
		 	return markerInfo;
		}
		
	
		function makeCourse() {
			var courseData;
			var mapInfo;
			var placeInfos = new Array();
			var map_photo_value = $('#map_photo').val().split("\\");
			var map_photo_name = map_photo_value[map_photo_value.length-1]; 
			
			mapInfo = {
				"map_title": $('#map_title').val(),
				"map_subtitle": $('#map_subtitle').val(),
				"map_country": $('#map_country').val(),
				"map_state": $('#map_state').val(),
				"map_city": $('#map_city').val(),
				"map_content": $('#map_content').val(),
				"map_photo" : map_photo_name,
				"theme_no": $('#theme_no').val()
			};
			
			for ( const key in markerInfos) {
				var placeInfo = {
					"place_name" : markerInfos[key].place_name,
					"place_lat" : String(markerInfos[key].place_lat),
					"place_lng" : String(markerInfos[key].place_lng),
					"place_loadaddr" : markerInfos[key].place_loadaddr,
					"place_addr" : markerInfos[key].place_addr,
					"place_photo" : markerInfos[key].place_photo,
					"place_content": markerInfos[key].place_content,
					"place_course_no": markerInfos[key].place_course_no
				};
				placeInfos.push(placeInfo);
			}
			
			
			getDataFromDrawingMap();
			console.log(lineInfos);
			courseData = {
					"mapInfo" : mapInfo,
					"placeInfos" : placeInfos,
					"routeInfos" : routeInfos
			};
			console.log(courseData);
			$.ajax({
				type : "POST",
				url : "mapcontrol/coursemake",
				//data : courseData,
				data : JSON.stringify(courseData),
				dataType : "text",
				contentType : "application/json; charset=utf-8",
				success : function(value) {
					alert("게시물이 등록 포인트 5000P가 추가되었습니다 !");
					console.log(value);
					location.href="main";
					/* $.ajax({
						type : "POST",
						url : "mapcontrol/coursedraw/"+value
					}) */
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("지도등록에 실패했습니다!!");
				}
			});
		}
		
		async function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback); 
		    return 1;
		}

		async function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		    return 1;
		}
		
		function displayMarkerEditor(markerInfo) {
			for(const key in markerInfos) {
				if(markerInfo.place_lat == markerInfos[key].place_lat && markerInfo.place_lng == markerInfos[key].place_lng) {
					console.log(markerInfos[key]);
					
					$("#divRoute").hide();
					$("#divPlace").show();
					
					//if(!markerInfos[key].created) {					
						$('#divPlaceForm_order').html('<label><h5>장소번호</h5></label><input type="text" id="place_course_no" class="form-control"  style="width: 620px" readonly/><br/><br/>');
						$('#place_course_no').val(markerInfos[key].place_course_no);
						
						$('#divPlaceForm_name').html('<label><h5>장소명</h5></label><input type="text" id="place_name" class="form-control"  style="width: 620px"/><br/><br/>');
						$('#place_name').val(markerInfos[key].place_name);
						
						$('#divPlaceForm_loadaddr').html('<label><h5>도로명주소</h5></label><input type="text" id="place_loadaddr" class="form-control"  style="width: 620px" readonly/><br/><br/>');
						$('#place_loadaddr').val(markerInfos[key].place_loadaddr);
						
						$('#divPlaceForm_addr').html('<label><h5>지번주소</h5></label><input type="text" id="place_addr" class="form-control"  style="width: 620px" readonly/><br/><br/>');
						$('#place_addr').val(markerInfos[key].place_addr);
						
						$('#divPlaceForm_lat').html('<label><h5>위도</h5></label><input type="text" id="place_lat" class="form-control"  style="width: 620px" readonly/><br>');
						$('#place_lat').val(markerInfos[key].place_lat);
						
						$('#divPlaceForm_lng').html('<label><h5>경도</h5></label><input type="text" id="place_lng" class="form-control"  style="width: 620px" readonly/><br>');
						$('#place_lng').val(markerInfos[key].place_lng); 
						
						$('#divPlaceForm_content').html('<label><h5>내용</h5></label><textarea id="place_content" class="form-control"  style="width: 620px" ></textarea><br/>');
						$('#place_content').val(markerInfos[key].place_content);
						
						$('#divPlaceForm_photo').html('<label><h5>장소 사진 업로드</h5></label><br/><input type="file" name="place_photo" id="place_photo" onchange="uploadFile()"></div><br/><br/>');
						$('#place_photo').val(markerInfos[key].place_photo);
					
						$('#divPlaceForm_delete').html('<button type=' + '"button"' + 'onclick=' + '"deleteMarker(' + key + ')" ' + 'class=' + '"btn btn-info"' + '><h5>삭제하기</h5></button>');	
					//	markerInfos[key].created = true;
					//} else {
					//	break;
					//}
					
					break;
				}
			}
		}
		
		
		function deleteMarker(index) {
			markers[index].setMap(null);
			markers.splice(index, 1);
			console.log(markers);
			
			markerInfos.splice(index, 1);
			for(var idx=index; idx<markerInfos.length; idx++) {
				markerInfos[idx].place_course_no = idx;
				console.log(markerInfos[idx]);
			}
			
			if(markers.length > 1) {
		 		markers[0].setImage(startImage);
		 		for(var idx=1; idx<markers.length-1; idx++) {
		 			markers[idx].setImage(null);
		 		}
		 		markers[markers.length-1].setImage(arriveImage);
		 	}
			placeCount--;
			deleteMarkerForm();
		}
		
		function deleteRoute(index) {
			manager.remove(lineInfos[index].obj);
			lineInfos.splice(index, 1);
			for(var idx=index; idx<lineInfos.length; idx++) {
				lineInfos[idx].route_course_no = idx;
			}
			routeCount--;
			deleteRouteForm();
		}
		function deleteMarkerForm() {
			$('#divPlace').hide();
		}
		
		function deleteRouteForm() {
			$('#divRoute').hide();
		}
		function displayRouteEditor(lineInfo) {
			for(const key in lineInfos) {
				//console.log("[listener Loop]" + lineInfos);
				if(lineInfo.route_idf_La == lineInfos[key].route_idf_La && lineInfo.route_idf_Ma == lineInfos[key].route_idf_Ma) {
                    //console.log("[lineInfo]" + lineInfos[key].route_course_no);
					$('#divPlace').hide();
                    $('#divRoute').show();
                    
                    $('#divRouteForm_order').html('<label><h5>경로번호</h5></label><input type="text" id="route_course_no" class="form-control" value="" style="width: 620px" readonly/><br/><br/>');
                    $('#route_course_no').val(lineInfos[key].route_course_no);
                    
		        	$('#divRouteForm_name').html('<label><h5>경로이름</h5></label><input type="text" id="route_name" class="form-control" value="" style="width: 620px"/><br/><br/>');
		        	$('#route_name').val(lineInfos[key].route_name); 
		        	
		        	$('#divRouteForm_type').html('<label><h5>경로타입</h5></label><input type="text" id="route_type" class="form-control" value="" style="width: 620px" readonly/><br/><br/>');
		        	$('#route_type').val(lineInfos[key].route_type);
		        	
		        	$('#divRouteForm_content').html('<label><h5>경로내용</h5></label><textarea id="route_content" class="form-control" value="" style="width: 620px"></textarea><br/><br/>');
		        	$('#route_content').val(lineInfos[key].route_content);
		        	
		        	$('#divRouteForm_delete').html('<button type=' + '"button"' + 'onclick=' + '"deleteRoute(' + key + ')" ' + 'class=' + '"btn btn-info"' + '><h5>삭제하기</h5></button>');	
		        	
		        	break;

                }
			}
		}
		//루트 클릭 이벤트 추가
		function addRouteClickEvent(lineInfo) {
			//console.log("[addRouteClickEvent]" + lineInfo.route_type);
			kakao.maps.event.addListener(lineInfo.obj, 'click', function() {
				//console.log("[addRouteClickEvent lineInfos length]" + lineInfos.length)
				//console.log("[lineInfo idf_La]" + lineInfo.route_idf_Ma);
				//console.log("[lineInfos idf_La]" + lineInfos[0].route_idf_Ma);
				displayRouteEditor(lineInfo);
			});
		
		   	  
	    }
		
		function addMarkerDragEvent(markerInfo) {
			kakao.maps.event.addListener(markerInfo.obj, 'dragend', function(mouseEvent) {
				markerInfos[markerInfo.place_course_no].place_lat = markerInfo.obj.getPosition().getLat();
				markerInfos[markerInfo.place_course_no].place_lng = markerInfo.obj.getPosition().getLng();
				
				searchDetailAddrFromCoords(markerInfo.obj.getPosition(), function(result, status) {
					if(status == kakao.maps.services.Status.OK) {
						detailLoadAddr = !!result[0].road_address ? result[0].road_address.address_name : '';
			            detailAddr = result[0].address.address_name;
			            
						//placeAddr1.push(detailLoadAddr);
						//placeAddr2.push(detailAddr);
						
						markerInfo.place_loadaddr = detailLoadAddr;
						markerInfo.place_addr = detailAddr;
						
						displayMarkerEditor(markerInfo);
						//console.log(markerInfo);
						console.log("도로명 : " + detailLoadAddr);
						console.log("지번 : " + detailAddr);
					}
				});
				
			});
		}
		//마커 클릭 이벤트 추가
		function addMarkerClickEvent(markerInfo) {
			kakao.maps.event.addListener(markerInfo.obj, 'click', function() {
				//console.log(markerInfo);
				displayMarkerEditor(markerInfo);				
			});
			
		}
		
		$(document).on('keyup', '#place_name', function() {
			let order = $('#place_course_no').val();
			let name = $('#place_name').val();
			markerInfos[order].place_name = name;
			//console.log("입력된 순번 :" + order);
			//console.log("입력된 장소명 :" + markerInfos[order].placeName);
		});
		

		$(document).on('keyup', '#place_content', function() {
			let order = $('#place_course_no').val();
			let content = $('#place_content').val();
			markerInfos[order].place_content = content;
			
			//console.log("입력된 내용 :" + markerInfos[order].placeContent);
		});
		
		
		//$(document).on('change', '#place_photo', function(){ 
		//	uploadFile(); 
		//	let order = $('#place_course_no').val();
		//	let place_photo_value = $('#place_photo').val().split("\\");
		//	let photo = place_photo_value[place_photo_value.length-1]; 
		//	markerInfos[order].place_photo = photo;
		//});
		
		function uploadFile(){
			let order = $('#place_course_no').val();
			let place_photo_value = $('#place_photo').val().split("\\");
			let photo = place_photo_value[place_photo_value.length-1]; 
			markerInfos[order].place_photo = photo;
		}
		
		$(document).on('keyup', '#route_name', function() {
			let order = $('#route_course_no').val();
			let name = $('#route_name').val();
			lineInfos[order].route_name = name;
		});
		
		$(document).on('keyup', '#route_content', function() {
			let order = $('#route_course_no').val();
			let content = $('#route_content').val();
			lineInfos[order].route_content = content;
		});
		
		
		function selectOverlay(type) {
			kakao.maps.event.removeListener(map, 'click', mapClickHandler);
		    // 그리기 중이면 그리기를 취소합니다
		    manager.cancel();

		    // 클릭한 그리기 요소 타입을 선택합니다
		    manager.select(kakao.maps.drawing.OverlayType[type]);
		}
		
		function getDataFromDrawingMap() {
		    // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
		    var drawingData = manager.getData();
		    var routeInfo;
		    
		    var polylineIndex = 0;
		    var arrowIndex = 0;
		    
		    
		    console.log(drawingData.polyline.length);
		    console.log(drawingData);
		    
	
		    for(var i = 0; i<lineInfos.length; i++) {
		    	lineInfos[i].route_path = '{"latlng" : [';
		    	//console.log(drawingData);
		    	//console.log(drawingData.polyline[i].points.length);
		    	//console.log(drawingData.polyline[i].points);
		    	if(lineInfos[i].route_type == 'polyline') {
			    	for(var j = 0; j<drawingData.polyline[polylineIndex].points.length; j++) {
			    		if(j == drawingData.polyline[polylineIndex].points.length -1) {
			    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.polyline[polylineIndex].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.polyline[polylineIndex].points[j].x + '"}';
			    		} else {
			    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.polyline[polylineIndex].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.polyline[polylineIndex].points[j].x + '"}, ';
			    		}
			    		//console.log(drawingData.polyline[i].points[j].x); //x : 경도
			    		//console.log(drawingData.polyline[i].points[j].y); //y : 위도
			    		
			    	}
			    	lineInfos[i].route_option = JSON.stringify(drawingData.polyline[polylineIndex].options);
			    	polylineIndex++;
		    	} else if(lineInfos[i].route_type == 'arrow') {
		    		for(var j = 0; j<drawingData.arrow[arrowIndex].points.length; j++) {
			    		if(j == drawingData.arrow[arrowIndex].points.length -1) {
			    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.arrow[arrowIndex].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.arrow[arrowIndex].points[j].x + '"}';
			    		} else {
			    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.arrow[arrowIndex].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.arrow[arrowIndex].points[j].x + '"}, ';
			    		}
			    		//console.log(drawingData.polyline[i].points[j].x); //x : 경도
			    		//console.log(drawingData.polyline[i].points[j].y); //y : 위도
			    		lineInfos[i].route_option = JSON.stringify(drawingData.arrow[arrowIndex].options);
			    	}
		    		arrowIndex++;
		    	}
		    	lineInfos[i].route_path += "]}";
		    	
		    	routeInfo = {
	   				"route_course_no" : lineInfos[i].route_course_no,
	   				"route_name" : lineInfos[i].route_name,
	   				"route_type" : lineInfos[i].route_type,
	   				"route_path" : lineInfos[i].route_path,
	   				"route_content" : lineInfos[i].route_content,
		    		"route_option" : lineInfos[i].route_option
		    	};
		    	routeInfos.push(routeInfo);
		    	//console.log("options::" + lineInfos[i].route_option);
		    }
		    console.log(lineInfos);
		    	
		}
	</script>
     <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/s/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html>