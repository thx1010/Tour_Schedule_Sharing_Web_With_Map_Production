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
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );"><br>
	        <div class="container">
		       <div class = "container" style="width: 800px; background-color: white; box-shadow: 1px 1px 1px 1px #E7E7E7; border-radius: 15px">
		       		<br><br>
		       		<h1 style="text-align: center">${mapInfo.map_title}</h1><br>
		       		<h5 style="text-align: center">${mapInfo.map_subtitle}</h5><br><br>
		       		<img src = "${pageContext.request.contextPath}/resources/img/${userInfo.user_photo}" style="width: 45px; height: 45px; display: block; margin: 0px auto;">
		       		<p style="text-align: center"><small>${userInfo.user_id}님의 게시글</small></p><br>
		       		<div class="row" style="margin-left: 690px">
			       			<button style="background-color: white; border: none"><h5 style="text-align: right; color: #DF4D4D; opacity: 0.9; font-size: 16px">&nbsp;&nbsp;신고하기</h5></button>
		       		</div>
		       		<div class="card mt-3" style="background-color: white">
						<div class="card-header" style="background-color: white">
							<br>
							<img src = "${pageContext.request.contextPath}/resources/img/${mapInfo.map_photo}" style="display: block; margin: 0px auto;">
							<br>
							<h5 class="card-title" style="text-align:center"><br>
									${mapInfo.map_country}&nbsp;&nbsp;${mapInfo.map_state}&nbsp;&nbsp;${mapInfo.map_city}
							</h5><br>
							<p class="card-title" style="text-align:center">
									${mapInfo.map_content}
							</p><br>
							<p class="card-title" style="text-align:center">
									${mapInfo.themeDTO.theme_name}
							</p><br>	
						</div><br>
						<div class="card-body" style="text-align:center"><br>
						<div id="map" style="width: 100%; height: 400px;"></div>
						<br>
						</div>
						<div class="col-9 text-left">
							<button onclick="setBounds()" style="background-color:white; border-radius: 10px; margin-left: 330px">한눈에보기</button>
						</div><br>
						<p class="card-title" style="padding-left:10px">
							<div id="divRoute">
				        		<div id="divRouteForm_order"></div>
				        		<div id="divRouteForm_name"></div>
				        		<div id="divRouteForm_type"></div>
				        		<div id="divRouteForm_content"></div>
				        	</div>
				        	<div id="divPlace">
				        	    <div id="divPlaceForm_photo"></div>
					        	<div id="divPlaceForm_order"></div>
								<div id="divPlaceForm_name"></div>
								<div id="divPlaceForm_loadaddr"></div>
								<div id="divPlaceForm_addr"></div>
								<div id="divPlaceForm_lat"></div>
								<div id="divPlaceForm_lng"></div>
								<div id="divPlaceForm_image"></div>
								<div id="divPlaceForm_content"></div>
							</div>
						</p> 
						<br>
						</div>
					</br>
					<a href = "update?no=${dto.no}"><button type="button" style="background-color: #EBF7FF; border-radius: 15%;">수정</button></a>
					<a href = "delete?no=${dto.no}"><button type="button" style="background-color: #EBF7FF; border-radius: 15%;">삭제</button></a>
					<a href = "list"><button type="button" style="background-color: #EBF7FF; border-radius: 15%;">리스트</button></a>
			   <br><br>
			   </div>	
			</div><br><br>
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
	                    $('#divRouteForm_order').html('<h5 style="text-align: center">'+routeList[key].route_course_no+'번 루트</h5><br/><br/>');
	                    
			        	$('#divRouteForm_name').html('<h2 style="text-align: center">'+routeList[key].route_name+'</h5><br/><br/>');
			        	
			        	$('#divRouteForm_type').html('<h5 style="text-align: center">'+routeList[key].route_type+'</h5><br/><br/>');
			        	
			        	$('#divRouteForm_content').html('<h5 style="text-align: center">'+routeList[key].route_content+'</h5><br/><br/>');
			        	
			        	break

                   	}
				 }
			});
		
		   	  
	    }
		
		//마커 클릭 이벤트 추가
		function addMarkerClickEvent(marker) {
			sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
			kakao.maps.event.addListener(marker, 'click', function() {
				//console.log(markerInfo);
				for(const key in placeList) {
					if(marker.getPosition().getLat() == placeList[key].place_lat && marker.getPosition().getLng() == placeList[key].place_lng) {
						console.log(placeList[key]);

						$("#divRoute").hide();
						$("#divPlace").show();
					
					//if(!markerInfos[key].created) {					
						$('#divPlaceForm_order').html('<h5 style="text-align: center">'+placeList[key].place_course_no+'</h5><br/><br/>');
						
						$('#divPlaceForm_name').html('<h2 style="text-align: center">'+placeList[key].place_name+'</h5><br/><br/>');
						
						$('#divPlaceForm_loadaddr').html('<h5 style="text-align: center">'+placeList[key].place_loadaddr+'</h5><br/><br/>');
						
						$('#divPlaceForm_addr').html('<h5 style="text-align: center">'+placeList[key].place_addr+'</h5><br/><br/>');

						var photo = placeList[key].place_photo;
						console.log(photo);
						$('#divPlaceForm_photo').html('<img src="'+sessionStorage.getItem("contextpath")+'/resources/img/'+photo+'" style="display: block; margin: 0px auto;"/><br/><br/>');
						
						$('#divPlaceForm_lat').html('<p style="text-align: center">'+placeList[key].place_lat+'</p>');
						
						$('#divPlaceForm_lng').html('<p style="text-align: center">'+placeList[key].place_lng+'</p>');
						
						$('#divPlaceForm_content').html('<h5 style="text-align: center">'+placeList[key].place_content+'</h5><br/><br/>');
						
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
				console.log("[polyline] : " + polyline);
			}
			
		}
	</script>
</html>