<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- <style>
.modes { position: absolute; top: 10px; left: 10px; z-index: 1;}
</style> -->
<title>Insert title here</title>
 <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
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
	<body>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand" href="main"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a class="navbar-brand" href="login" style="color:#BDBDBD; font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인</a></div>
            		<div class="hevent"><a class="navbar-brand" href="signup" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></div>
					<div class="hevent"><a class="navbar-brand" href="adminlogin" style="color:#6799FF; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자로 로그인</a></div>
<%
	} else {%>
					<p class="navbar-brand" style="color:#6799FF; font-size:14px">${sessionScope.userInfo.user_id} 님 환영합니다!</p>
                    <div class="hevent"><a class="navbar-brand" href="logout" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a class="navbar-brand" href="likepage" style="color:#878787; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src = "resources/img/heart.png" style="width: 25px; height:25px;">&nbsp;내가 찜한 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
            		<div class="tscale"><a class="navbar-brand" href="cartpage" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/cart.png" style="width: 28px; height:28px;">&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="tscale"><a class="navbar-brand" href="mypage/${sessionScope.userInfo.user_no}" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "resources/img/user.png" style="width: 25px; height:25px;">&nbsp;마이페이지</a></div>
            	</div>
            </div>
        </nav><br><br>
      	<div>
      		<label>여행제목</label><br/><input type="text" id="map_title" name="map_title"/><br/>
      		<label>부제</label><br/><input type="text" id="map_subtitle" name="map_subtitle"/><br/>
      		<label>테마</label>
      		<select id="theme_no" name="theme_no">
      			<c:forEach var="theme" items='${themeList}'>
      				<option value="${theme.theme_no}">${theme.theme_name}</option>
      			</c:forEach>
      		</select><br/>
      		<label>국가</label><br/><input type="text" id="map_country" name="map_country"/><br/>
      		<label>주</label><br/><input type="text" id="map_state" name="map_state"/><br/>
      		<label>도시</label><br/><input type="text" id="map_city" name="map_city"/><br/>
      		<label>설명</label><br/><textarea id="map_content" name="map_content"></textarea><br/>
      	</div>
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );">
	        <div class="container">
		            <h2 style=" text-align:center; margin-bottom: 60px;">'</h2>
				    <div class="parent2">
				        <div class="first2">
				        	<div id="map" style="width: 100%; height: 400px;"></div>
				        	<div>
					        	<p>
					        		<button onclick="selectOverlay('ARROW')">화살표</button>
								    <button onclick="selectOverlay('POLYLINE')">선</button>
								    <button onclick="selectOverlay('CIRCLE')">원</button>
								    <button onclick="selectOverlay('RECTANGLE')">사각형</button>
								    <button onclick="getDataFromDrawingMap()">가져오기</button>
								</p>
				        	</div>
				        	<h4 style="text-align: center; background-color: ">맵 공간</h4>
				        </div>
				        <div class="second2">
				        	<!-- 여기 입력 폼 -->
				        	<div id="divRoute">
				        		<div id="divRouteForm_order"></div>
				        		<div id="divRouteForm_name"></div>
				        		<div id="divRouteForm_type"></div>
				        		<div id="divRouteForm_content"></div>
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
							</div>
				        	<h4 style="text-align: center;">입력 폼 공간</h4>
				        </div>
			        </div>
			        <h2 style=" text-align:center; margin-bottom: 60px;">'</h2>
			</div>
			<div>
				<button onclick="makeCourse()">지도만들기</button>
			</div>
	    </header>
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
			level : 14
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
			    	removable: true,
			    	strokeColor: '#39f',
			    	hintStrokeStyle: 'dash'
			    },
			    polylineOptions: { // 선 옵션입니다
			        draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
			        removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
			        editable: true, // 그린 후 수정할 수 있도록 설정합니다 
			        strokeColor: '#39f', // 선 색
			        hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
			        hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
			    },
			    rectangleOptions: {
			        draggable: true,
			        removable: true,
			        editable: true,
			        strokeColor: '#39f', // 외곽선 색
			        fillColor: '#39f', // 채우기 색
			        fillOpacity: 0.5 // 채우기색 투명도
			    },
			    circleOptions: {
			        draggable: true,
			        removable: true,
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
		 	
		 	return markerInfo;
		}
		
	
		function makeCourse() {
			var courseData;
			var mapInfo;
			var placeInfos = new Array();
			
			
			mapInfo = {
				"map_title": $('#map_title').val(),
				"map_subtitle": $('#map_subtitle').val(),
				"map_country": $('#map_country').val(),
				"map_state": $('#map_state').val(),
				"map_city": $('#map_city').val(),
				"map_content": $('#map_content').val(),
				"map_photo" : 'C:/',
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
					alert("지도등록에 성공했습니다!!");
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
		
		//루트 클릭 이벤트 추가
		function addRouteClickEvent(lineInfo) {
			//console.log("[addRouteClickEvent]" + lineInfo.route_type);
			kakao.maps.event.addListener(lineInfo.obj, 'click', function() {
				//console.log("[addRouteClickEvent lineInfos length]" + lineInfos.length)
				//console.log("[lineInfo idf_La]" + lineInfo.route_idf_Ma);
				//console.log("[lineInfos idf_La]" + lineInfos[0].route_idf_Ma);
				for(const key in lineInfos) {
					//console.log("[listener Loop]" + lineInfos);
					if(lineInfo.route_idf_La == lineInfos[key].route_idf_La && lineInfo.route_idf_Ma == lineInfos[key].route_idf_Ma) {
                        //console.log("[lineInfo]" + lineInfos[key].route_course_no);
						$('#divPlace').hide();
                        $('#divRoute').show();
                        
	                    $('#divRouteForm_order').html('<label>경로번호 </label><input type="text" id="route_course_no"/><br/><br/>');
	                    $('#route_course_no').val(lineInfos[key].route_course_no);
	                    
			        	$('#divRouteForm_name').html('<label>경로이름 </label><input type="text" id="route_name"/><br/><br/>');
			        	$('#route_name').val(lineInfos[key].route_name); 
			        	
			        	$('#divRouteForm_type').html('<label>경로타입 </label><input type="text" id="route_type"/><br/><br/>');
			        	$('#route_type').val(lineInfos[key].route_type);
			        	
			        	$('#divRouteForm_content').html('<label>경로내용 </label><textarea id="route_content"></textarea><br/><br/>');
			        	$('#route_content').val(lineInfos[key].route_content);
			        	
			        	break;

                    }
				}
			});
		
		   	  
	    }
		
		//마커 클릭 이벤트 추가
		function addMarkerClickEvent(markerInfo) {
			kakao.maps.event.addListener(markerInfo.obj, 'click', function() {
				//console.log(markerInfo);
				for(const key in markerInfos) {
					if(markerInfo.place_lat == markerInfos[key].place_lat && markerInfo.place_lng == markerInfos[key].place_lng) {
						console.log(markerInfos[key]);
						
						$("#divRoute").hide();
						$("#divPlace").show();
						
						//if(!markerInfos[key].created) {					
							$('#divPlaceForm_order').html('<label>장소번호 </label><input type="text" id="place_course_no"/><br/><br/>');
							$('#place_course_no').val(markerInfos[key].place_course_no);
							
							$('#divPlaceForm_name').html('<label>장소명 </label><input type="text" id="place_name"/><br/><br/>');
							$('#place_name').val(markerInfos[key].place_name);
							
							$('#divPlaceForm_loadaddr').html('<label>도로명주소 </label><input type="text" id="place_loadaddr"/><br/><br/>');
							$('#place_loadaddr').val(markerInfos[key].place_loadaddr);
							
							$('#divPlaceForm_addr').html('<label>지번주소 </label><input type="text" id="place_addr"/><br/><br/>');
							$('#place_addr').val(markerInfos[key].place_addr);
							
							$('#divPlaceForm_lat').html('<label>위도 </label><input type="text" id="place_lat"/>');
							$('#place_lat').val(markerInfos[key].place_lat);
							
							$('#divPlaceForm_lng').html('<label>경도 </label><input type="text" id="place_lng"/>');
							$('#place_lng').val(markerInfos[key].place_lng); 
							
							$('#divPlaceForm_content').html('<label>내용 </label><textarea id="place_content"></textarea><br/><br/>');
							$('#place_content').val(markerInfos[key].place_content);
							
						//	markerInfos[key].created = true;
						//} else {
						//	break;
						//}
						
						break;
					}
				}
		
				
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
		    
		    console.log(drawingData.polyline.length);
		    for(var i = 0; i<drawingData.polyline.length; i++) {
		    	lineInfos[i].route_path = '{"latlng" : [';
		    	console.log(drawingData);
		    	//console.log(drawingData.polyline[i].points.length);
		    	//console.log(drawingData.polyline[i].points);
		    	for(var j = 0; j<drawingData.polyline[i].points.length; j++) {
		    		if(j == drawingData.polyline[i].points.length -1) {
		    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.polyline[i].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.polyline[i].points[j].x + '"}';
		    		} else {
		    			lineInfos[i].route_path += '{"lat" : ' + '"' + drawingData.polyline[i].points[j].y + '"' + " , " + '"lng" : ' + '"' + drawingData.polyline[i].points[j].x + '"}, ';
		    		}
		    		//console.log(drawingData.polyline[i].points[j].x); //x : 경도
		    		//console.log(drawingData.polyline[i].points[j].y); //y : 위도
		    		
		    	}
		    	lineInfos[i].route_path += "]}";
		    	lineInfos[i].route_option = JSON.stringify(drawingData.polyline[i].options);
		    	routeInfo = {
	   				"route_course_no" : lineInfos[i].route_course_no,
	   				"route_name" : lineInfos[i].route_name,
	   				"route_type" : lineInfos[i].route_type,
	   				"route_path" : lineInfos[i].route_path,
	   				"route_content" : lineInfos[i].route_content,
		    		"route_option" : lineInfos[i].route_option
		    	};
		    	routeInfos.push(routeInfo);
		    	console.log("options::" + lineInfos[i].route_option);
		    }
		    	
		}
	</script>
</html>