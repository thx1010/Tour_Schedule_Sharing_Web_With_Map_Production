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
 <link href="${pageContext.request.contextPath}/resources/css/starrate.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
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
<style>
.navbar-brand, h1, h2, h3, h4, h5{
	font-family: 'Do Hyeon';
}
</style>
</head>
	<body>
         <nav class="navbar">
            <div class="container"  style="margin-top: 95px;">
            	<div class="row"><br><br>
            		<a class="navbar-brand" href="/board/main"><b><h3 style="font-size:25px; background: linear-gradient( to right, white, #C4DEFF ); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">NO ONE KNOWS</h3></b></a>
            		
<% 
	if(session.getAttribute("userInfo") == null){ 
%>
	
            		<div class="hevent"><a href="/board/login"><h5 style="color:#E8FFFF; font-size:13px;">로그인</h5></a></div>
            		<div class="hevent"><a href="/board/signup"><h5 style="color:#E8FFFF; font-size:13px">회원가입</h5></a></div>
					<div class="hevent"><a href="/board/adminlogin"><h5 style="color:#E8FFFF; font-size:13px">관리자로 로그인</h5></a></div>
<%
	} else {%>
					<h5 style="color:#E8FFFF; font-size:13px">${sessionScope.userInfo.user_id} 님 환영합니다!</h5>
                    <div class="hevent"><a href="/board/logout"><h5 style="color:#E8FFFF; font-size:13px">로그아웃</h5></a></div>
<% } %>
            	</div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
            	<div class="row">
            		<div class="tscale"><a href="/board/likepage" style="color:white; font-size:14px;"><img src = "${pageContext.request.contextPath}/resources/img/heart2.png" style="width: 18px; height:18px;">&nbsp;&nbsp;내가 찜한 코스</a></div>
            		<div class="tscale"><a href="/board/cartpage" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/cart.png" style="width: 18px; height:18px;">&nbsp;&nbsp;장바구니</a></div>
                    <div class="tscale"><a href="/board/mypage/${sessionScope.userInfo.user_no}" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/info.png" style="width: 18px; height:18px;">&nbsp;&nbsp;마이페이지</a></div>
                    <div class="tscale"><a href="/board/coursemaker" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/check.png" style="width: 18px; height:18px;">&nbsp;&nbsp;여행코스 만들기</a></div>
            		<div class="tscale"><a href="/board/chatroom" style="color:white; font-size:14px"><img src = "${pageContext.request.contextPath}/resources/img/chat.png" style="width: 20px; height:20px;">&nbsp;&nbsp;커뮤니티</a></div>
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
									 	<h2 style="text-align: center; font-size: 60px">${mapInfo.map_title}</h2><br>
							       		<h5 style="text-align: center; font-size: 35px">${mapInfo.map_subtitle}</h5><br><br>
							       		<img src = "${pageContext.request.contextPath}/resources/img/${userInfo.user_photo}" style="width: 45px; height: 45px; display: block; margin: 0px auto;">
							       		<p style="text-align: center"><small>${userInfo.user_id}님의 게시글</small></p><br>
							       		<!-- 신고 버튼 추가 -->
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
												<button onclick="setBounds()" style="background-color:white; border-radius: 10px; margin-left: 390px">한눈에보기</button>
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
										
										 <br><br>
			   		<div class="wrap">
					    <form class="reviewform" method="post">
					        <input type="hidden" name="rate" id="rate" value="0"/>
					        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
					 
					        <div class="review_rating">
					            <div class="warning_msg">별점을 선택해 주세요.</div>
					            <div class="rating">
					                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
					                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
					                <label for="rating1"></label>
					                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
					                <label for="rating2"></label>
					                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
					                <label for="rating3"></label>
					                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
					                <label for="rating4"></label>
					                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
					                <label for="rating5"></label>
					            </div>
					        </div>
					        <div class="review_contents">
					            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
					            <textarea rows="10" class="review_textarea"></textarea>
					        </div>   
					        <div class="cmd">
					            <input type="button" name="save" id="save" value="등록">
					        </div>
					    </form>
					</div>
					<hr width="100%" color="blue">
					<div class="wrap" id="otherReview">
					
					</div>
					<div id="reviewPage">
					</div>
			   </div>	
			</div><br><br>
									</section>
								<a id="bottom"></a>
							</section>
					</div>
        <!-- Bootstrap core JS-->
         <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/s/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	</body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f99123b49282be7b5dcbc9dbff6f616&libraries=services,drawing">
	</script>
	<script>
		$(document).ready(function(){
			reviewing();
		});
		
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
	    
	    
		var placeCount = 0;
		var routeCount = 0;
		var currentPage = 1;
		
		
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
			
			if(key == 0) {
				marker.setImage(startImage);
			}
			
			if(key == placeList.length -1) {
				marker.setImage(arriveImage);
			}
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
				if(lines[i].route_type == 'polyline') {
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
				} else if(lines[i].route_type == 'arrow') {
					var arrow = new kakao.maps.Polyline({
						map: map,
						path: path,
						endArrow: true,
						strokeColor: style.strokeColor,
			            strokeOpacity: style.strokeOpacity,
			            strokeStyle: style.strokeStyle,
			            strokeWeight: style.strokeWeight,
			            clickable: true
					});
					
					overlays.push(arrow);
					lines[i].obj = arrow;
				}
				
				
				addRouteClickEvent(lines[i]);
				//console.log("[polyline] : " + polyline);
				//console.log("[polyline] : " + polyline);
			}
			
		}
		
		function drawArrow(lines) {
			
		}
		
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		    this.rate = newrate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		    	console.log(items);
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		}
		let rating = new Rating();//별점 인스턴스 생성
		
		document.addEventListener('DOMContentLoaded', function(){
		    //별점선택 이벤트 리스너
		    document.querySelector('.rating').addEventListener('click',function(e){
		        let elem = e.target;
		        if(elem.classList.contains('rate_radio')){
		            rating.setRate(parseInt(elem.value));
		        }
		    })
		});
		
		document.querySelector('.review_textarea').addEventListener('keydown',function(){
			//리뷰 400자 초과 안되게 자동 자름
			let review = document.querySelector('.review_textarea');
			let lengthCheckEx = /^.{400,}$/;
			if(lengthCheckEx.test(review.value)){
			    //400자 초과 컷
			    review.value = review.value.substr(0,400);
			}
		});

		//저장 전송전 필드 체크 이벤트 리스너
		document.querySelector('#save').addEventListener('click', function(e){
			//별점 선택 안했으면 메시지 표시
			if(rating.rate == 0){
			    rating.showMessage('rate');
			    return false;
			}
			//리뷰 5자 미만이면 메시지 표시
			if(document.querySelector('.review_textarea').value.length < 5){
			    rating.showMessage('review');
			    return false;
			}
			//폼 서밋
			var user_no = ${sessionScope.userInfo.user_no};
			var map_no = ${mapInfo.map_no};
			var review_data = {"rating" : rating.rate, "content" : document.querySelector('.review_textarea').value, "load" : false};
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/mapcontrol/coursedraw/' + map_no + '/' + user_no + '/' + currentPage, 
				data : review_data,
				dataType : "json",
			}).done(function( data ) {
				//console.log(data);
				if(data.result == 'success') {
					//console.log(data.reviewList);
					//console.log(data.myReview);
					//console.log(data.page);
					//console.log(data.msg);
					setMyReview(data.myReview);
					displayOtherReview(data.reviewList);
					displayPageList(data.page);
				} else {
					alert(data.msg);
				}
			});
			
		});
		
		
		Rating.prototype.showMessage = function(type){//경고메시지 표시
			switch(type){
			    case 'rate':
			        //안내메시지 표시
			        document.querySelector('.review_rating .warning_msg').style.display = 'block';
			        //지정된 시간 후 안내 메시지 감춤
			        setTimeout(function(){
			            document.querySelector('.review_rating .warning_msg').style.display = 'none';
			        },1000);            
			        break;
			    case 'review':
			        //안내메시지 표시
			        document.querySelector('.review_contents .warning_msg').style.display = 'block';
			        //지정된 시간 후 안내 메시지 감춤
			        setTimeout(function(){
			            document.querySelector('.review_contents .warning_msg').style.display = 'none';
			        },1000);    
			        break;
			}
		}
		
		function setMyReview(data) {
			rating.rate = data.review_rate;
			this.rate = data.review_rate;
			var newrate = data.review_rate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		    	console.log(items);
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		    
			$('.review_textarea').val(data.review_content);
		}
		
		
		function reviewing() {
			var user_no = ${sessionScope.userInfo.user_no};
			var map_no = ${mapInfo.map_no};
			var review_data = {"rating" : rating.rate, "content" : document.querySelector('.review_textarea').value, "load" : true};
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/mapcontrol/coursedraw/' + map_no + '/' + user_no + '/' + currentPage, 
				data : review_data,
				dataType : "json",
			}).done(function( data ) {
				//console.log(data);
				if(data.result == 'success') {
					//console.log(data.reviewList);
					//console.log(data.myReview);
					//console.log(data.page);
					//console.log(data.msg);
					setMyReview(data.myReview);
					displayOtherReview(data.reviewList);
					displayPageList(data.page);
				} else {
					alert(data.msg);
				}
			});
		}
		
		function displayOtherReview(data) {
			console.log(data);
			var otherReviews = "";
			for(var rCount=0; rCount<data.length; rCount++) {
				otherReviews += '<div class=' + '"reviewform"' + '><br>';
	            	otherReviews += '<div class=' + '"rating"' + '>';
	            		otherReviews += data[rCount].user_name;
	            for(var sCount=1; sCount<=5; sCount++) {
	            	if(sCount <= data[rCount].review_rate) {
	            		otherReviews += '<input type=' + '"checkbox"' + 'name=' + '"rating"' + 'id=' + '"rating"' + 'class=' + '"rate_radio"' +  'checked=' + '"checked"' + '>';
	            		otherReviews += '<label for=' +'"rating"' + '></label>';
	            	} else {
	            		otherReviews += '<input type=' + '"checkbox"' + 'name=' + '"rating"' + 'id=' + '"rating"' + 'class=' + '"rate_radio"' + '>';
	            		otherReviews += '<label for=' +'"rating"' + '></label>';
	            	}
	            }
	            
            	otherReviews += '</div>';
		        otherReviews += '</div><br>';
		        otherReviews += '<div class=' + '"otherReview_contents"' +'>';
		        	otherReviews += '<h2' + 'class=' + '"otherReview_textarea"' + '>' + data[rCount].review_content + '</h2>';
		        otherReviews += '</div>';
		        otherReviews += '<hr>';
			}
        	$('#otherReview').html(otherReviews);
		}
		
		function displayPageList(data) {
			var myPage = "";
			myPage += '<a href=# onclick=reviewing(' + data.prevPage + ')><< </a>';
			
			
			for(var i=data.startPage; i<=data.endPage; i++) {
				if(i == data.currentPage) {
					myPage += i + ' ';
					currentPage = i;
				} else {
					myPage += '<a href=# onclick=selectContent(' + i + ')>' + i + ' ' + '</a>';
				}
			}
			
			myPage += '<a href=# onclick=reviewing(' + data.nextPage + ')>>></a>';
			$('#reviewPage').html(myPage);
		}
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html>