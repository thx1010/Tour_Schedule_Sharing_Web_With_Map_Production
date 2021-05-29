<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="mapInfo" value='${mapInfo}'/>
<c:set var="placeList" value='${placeList}'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Insert title here</title>
 <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
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
            		<a class="navbar-brand" href="${pageContext.request.contextPath}/main"><b><h3 style="font-size:25px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;NO</h3></b></a>
            		<a class="navbar-brand" href="${pageContext.request.contextPath}/main"><b><h3 style="font-size:25px;">One</h3></b></a>
            		<a class="navbar-brand" href="${pageContext.request.contextPath}/main"><b><h3 style="font-size:25px; color: black;">Knows&nbsp;&nbsp;&nbsp;&nbsp;</h3></b></a>
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a class="navbar-brand" href="${pageContext.request.contextPath}/login" style="color:#BDBDBD; font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인</a></div>
            		<div class="hevent"><a class="navbar-brand" href="${pageContext.request.contextPath}/signup" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></div>
					<div class="hevent"><a class="navbar-brand" href="${pageContext.request.contextPath}/adminlogin" style="color:#6799FF; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자로 로그인</a></div>
<%
	} else {%>
					<p class="navbar-brand" style="color:#6799FF; font-size:14px">${sessionScope.userInfo.user_id} 님 환영합니다!</p>
                    <div class="hevent"><a class="navbar-brand" href="${pageContext.request.contextPath}/logout" style="color:#BDBDBD; font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg" style="background: white;">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a class="navbar-brand" href="likepage" style="color:#878787; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/heart.png" style="width: 25px; height:25px;">&nbsp;내가 찜한 코스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
            		<div class="tscale"><a class="navbar-brand" href="cartpage" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/cart.png" style="width: 28px; height:28px;">&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="tscale"><a class="navbar-brand" href="mypage/${sessionScope.userInfo.user_no}" style="color:#878787; font-size:14px">&nbsp;&nbsp;<img src = "${pageContext.request.contextPath}/resources/img/user.png" style="width: 25px; height:25px;">&nbsp;마이페이지</a></div>
            	</div>
            </div>
        </nav><br><br>
      	<div>
      		<label>등록번호</label>${mapInfo.map_no}<br/>
      		<label>여행제목</label><br/>${mapInfo.map_title}<br/>
      		<label>부제</label><br/>${mapInfo.map_subtitle}<br/>
      		<label>테마</label><br/>${mapInfo.themeDTO.theme_name}<br/>
      		<label>국가</label><br/>${mapInfo.map_country}<br/>
      		<label>주</label><br/>${mapInfo.map_state}<br/>
      		<label>도시</label><br/>${mapInfo.map_city}<br/>
      		<label>설명</label><br/>${mapInfo.map_content}<br/>
      	</div>
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );">
	        <div class="container">
		            <h2 style=" text-align:center; margin-bottom: 60px;">'</h2>
				    <div class="parent2">
				        <div class="first2">
				        	<div id="map" style="width: 100%; height: 400px;"></div>
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
				<button onclick="setBounds()">한눈에보기</button>
			</div>
	    </header>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	</body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f99123b49282be7b5dcbc9dbff6f616&libraries=services,drawing">
	</script>
	<script>
		var placeCount = 0;
		var routeCount = 0;
		
		
		
		var placeList = new Array();
		var routeList = new Array();
		
		<c:forEach var="place" items="${placeList}">
			var placeInfo = {
					"place_no" : "${place.place_no}",
					"place_name" : "${place.place_name}",
					"place_addr" : "${place.place_addr}",
					"place_loadaddr" : "${place.place_loadaddr}",
					"place_lat" : "${place.place_lat}",
					"place_lng" : "${place.place_lng}",
					"place_content" : "${place.place_content}",
					"place_photo" : "${place.place_photo}",
					"place_course_no" : "${place.place_course_no}"
			};			
			placeList.push(placeInfo);
			console.log("받아온장소이름 :::: "+ placeInfo.place_name + placeInfo.place_lat);
		</c:forEach>
		
		<c:forEach var="route" items="${routeList}">
			var routeInfo = {
					"obj" : '',
					"route_no" : "${route.route_no}",
					"route_name" : "${route.route_name}",
					"route_type" : "${route.route_type}",
					"route_content" : "${route.route_content}",
					"route_path" : JSON.parse('${route.route_path}'),
					"route_option" : JSON.parse('${route.route_option}'),
					"route_course_no" : ${route.route_course_no}
			};			
			routeList.push(routeInfo);
			console.log("받아온루트이름 :::: " + routeInfo.route_name);
			console.log("받아온루트패스 :::: " + routeInfo.route_path);
			console.log(routeInfo.route_path.latlng);
			console.log(routeInfo);
		</c:forEach> 
		//var placeList = '<c:out value="${placeList}"/>';
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57594644036231, 126.97685536561725), // 지도의 중심좌표
			level : 11
		// 지도의 확대 레벨
		};
		
		
		
		
		
		var map = new kakao.maps.Map(mapContainer, mapOption),
			overlays = []; // 지도를 생성합니다		
		var bounds = new kakao.maps.LatLngBounds();
		var geocoder = new kakao.maps.services.Geocoder();
		
		//controller
		var mapTypeControl = new kakao.maps.MapTypeControl();
		var zoomControl = new kakao.maps.ZoomControl();
		
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		map.addControl(zoomControl, kakao.maps.ControlPosition.Right);
		
		
		for(const key in placeList) {
			console.log("["+key+"] " + placeList[key].place_lat + " , " + placeList[key].place_lng);
			var maplatlng = new kakao.maps.LatLng(placeList[key].place_lat, placeList[key].place_lng); 
			var maptitle = "[" + placeList[key].place_course_no + "] " + placeList[key].place_name;
			var marker = new kakao.maps.Marker({
				map: map,
				title: maptitle,
				position: maplatlng,
				draggable: false,
		 		clickable: true
			});
			bounds.extend(maplatlng);
			addMarkerClickEvent(marker);
		}
		
		//루트그리기
		drawPolyLine(routeList);
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback); 
		    return 1;
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		    return 1;
		}
		
		//polyline 이벤트
		function addRouteClickEvent(routeInfo) {
			
			//console.log("[addRouteClickEvent]" + lineInfo.route_type);
			kakao.maps.event.addListener(routeInfo.obj, 'click', function() {
				//console.log("[addRouteClickEvent]" + routeInfo);
				//console.log("[addRouteClickEvent lineInfos length]" + lineInfos.length)
				//console.log("[lineInfo idf_La]" + lineInfo.route_idf_Ma);
				//console.log("[lineInfos idf_La]" + lineInfos[0].route_idf_Ma);
				 for(const key in routeList) {
					//console.log("[listener Loop]" + lineInfos);
					if(routeInfo.route_course_no == routeList[key].route_course_no) {
		
                       //console.log("[lineInfo]" + lineInfos[key].route_course_no);
						$('#divPlace').hide();
                        $('#divRoute').show();
                        
	                    $('#divRouteForm_order').html('<label>경로번호 </label><input type="text" id="route_course_no"/><br/><br/>');
	                    $('#route_course_no').val(routeList[key].route_course_no);
	                    
			        	$('#divRouteForm_name').html('<label>경로이름 </label><input type="text" id="route_name"/><br/><br/>');
			        	$('#route_name').val(routeList[key].route_name); 
			        	
			        	$('#divRouteForm_type').html('<label>경로타입 </label><input type="text" id="route_type"/><br/><br/>');
			        	$('#route_type').val(routeList[key].route_type);
			        	
			        	$('#divRouteForm_content').html('<label>경로내용 </label><textarea id="route_content"></textarea><br/><br/>');
			        	$('#route_content').val(routeList[key].route_content);
			        	
			        	break

                   	}
				 }
			});
		
		   	  
	    }
		
		//마커 클릭 이벤트 추가
		function addMarkerClickEvent(marker) {
			kakao.maps.event.addListener(marker, 'click', function() {
				//console.log(markerInfo);
				for(const key in placeList) {
					if(marker.getPosition().getLat() == placeList[key].place_lat && marker.getPosition().getLng() == placeList[key].place_lng) {
						console.log(placeList[key]);

						$("#divRoute").hide();
						$("#divPlace").show();
					
					//if(!markerInfos[key].created) {					
						$('#divPlaceForm_order').html('<label>코스번호 </label><input type="text" id="place_course_no"/><br/><br/>');
						$('#place_course_no').val(placeList[key].place_course_no);
						
						$('#divPlaceForm_name').html('<label>장소명 </label><input type="text" id="place_name"/><br/><br/>');
						$('#place_name').val(placeList[key].place_name);
						
						$('#divPlaceForm_loadaddr').html('<label>도로명주소 </label><input type="text" id="place_loadaddr"/><br/><br/>');
						$('#place_loadaddr').val(placeList[key].place_loadaddr);
						
						$('#divPlaceForm_addr').html('<label>지번주소 </label><input type="text" id="place_addr"/><br/><br/>');
						$('#place_addr').val(placeList[key].place_addr);
						
						
						
						$('#divPlaceForm_lat').html('<label>위도 </label><input type="text" id="place_lat"/>');
						$('#place_lat').val(placeList[key].place_lat);
						
						
						$('#divPlaceForm_lng').html('<label>경도 </label><input type="text" id="place_lng"/>');
						$('#place_lng').val(placeList[key].place_lng); 
						
						$('#divPlaceForm_content').html('<label>내용 </label><textarea id="place_content"></textarea><br/><br/>');
						$('#place_content').val(placeList[key].place_content);
						
					//	markerInfos[key].created = true;
					//} else {
					//	break;
					//}
					
						break;
					}
				}
		
				
			});
			
		}	
		
		function setBounds() {
			map.setBounds(bounds);
		}
		
		
		function pointsToPath(points) {
			console.log(points);
		    var len = points.length, 
		        path = [], 
		        i = 0;

		    for (; i < len; i++) { 
		        var latlng = new kakao.maps.LatLng(points[i].lat, points[i].lng);
		        console.log("[latlng] : ]" + latlng);
		        path.push(latlng); 
		    }

		    return path;
		}
		
		
		function drawPolyLine(lines) {
			var len = lines.length, i = 0;
			for(; i<len; i++) {
				var path = pointsToPath(lines[i].route_path.latlng);
				var style = lines[i].route_option;
				var polyline = new kakao.maps.Polyline({
					map: map,
					path: path,
					strokeColor: style.strokeColor,
		            strokeOpacity: style.strokeOpacity,
		            strokeStyle: style.strokeStyle,
		            strokeWeight: style.strokeWeight,
		            clickable: true
				});
				overlays.push(polyline);
				lines[i].obj = polyline;
				addRouteClickEvent(lines[i]);
				console.log("[polyline] : " + polyline);
			}
			
		}
	</script>
</html>