<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />
<link href="resources/css/style.css" rel="stylesheet"><link href="css/style-responsive.css" rel="stylesheet">
 <link href="resources/css/jquery-sakura.css" rel="stylesheet" type="text/css" />
 <noscript><link rel="stylesheet" href="resources/css/noscript.css" /></noscript>
</head>
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
       <div id="wrapper">

				<!-- Header -->
					<header id="header">
						<p style="color: white; opacity: 0.8; font-size: 14px">사용자 정보를 모두 입력해 주세요</p>
					</header>

				<!-- Main -->
					<div id="main">
						<!-- Content -->
							<section id="content" class="main">
								<!-- Text -->
									<section>
										<section>
										<form method="post" action="#">
											<div class="row gtr-uniform">
												<div class="col-12">
													<label><h2>ID</h2></label>
													<input type="text" name="user_id" placeholder="아이디" />
												</div>
												<div class="col-6 col-12-xsmall">
													<label><h2>비밀번호</h2></label>
													<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호" />
												</div>
												<div class="col-6 col-12-xsmall">
													<label><h2>비밀번호 확인</h2></label>
													<input type="password" id="user_pw_chk" name="user_pw_chk" placeholder="비밀번호" />
													<font id="chkNotice" size="2"></font>
												</div>
												<div class="col-6 col-12-xsmall">
													<label><h2>이름</h2></label>
													<input type="text" name="user_name" placeholder="이름" />
												</div>
												<div class="col-6 col-12-xsmall">
													<label><h2>이메일</h2></label>
													<input type="email" name="user_email" placeholder="이메일" />
												</div>
												
												<label style="width: 800px"><h2>생일</h2></label>
												<div class="col-4 col-12-xsmall">
													<select name="user_year" id="user_year" >
														<option value="">-- 년도 --</option>
												        <option value="1993">1993</option>
												        <option value="1995">1994</option>
												        <option value="1995">1995</option>
												        <option value="1996">1996</option>
												        <option value="1997">1997</option>
												        <option value="1998">1998</option>
													</select>
												</div>
												<div class="col-4 col-12-xsmall">
													<select name="user_month" id="user_month" >
														<option value="">-- 월 --</option>
												        <option value="01">01</option>
												        <option value="02">02</option>
												        <option value="03">03</option>
												        <option value="04">04</option>
												        <option value="05">05</option>
												        <option value="06">06</option>
												        <option value="07">07</option>
												        <option value="08">08</option>
												        <option value="09">09</option>
												        <option value="10">10</option>
												        <option value="11">11</option>
												        <option value="12">12</option>
													</select>
												</div>
												<div class="col-4 col-12-xsmall">
													<select name="user_day" id="user_day" >
														<option value="">-- 일 --</option>
												        <option value="01">01</option>
												        <option value="02">02</option>
												        <option value="03">03</option>
												        <option value="04">04</option>
												        <option value="05">05</option>
												        <option value="06">06</option>
												        <option value="07">07</option>
												        <option value="08">08</option>
												        <option value="09">09</option>
												        <option value="10">10</option>
												        <option value="11">11</option>
												        <option value="12">12</option>
												        <option value="13">13</option>
												        <option value="14">14</option>
												        <option value="15">15</option>
												        <option value="16">16</option>
												        <option value="17">17</option>
												        <option value="18">18</option>
												        <option value="19">19</option>
												        <option value="20">20</option>
												        <option value="21">21</option>
												        <option value="22">22</option>
												        <option value="23">23</option>
												        <option value="24">24</option>
												        <option value="25">25</option>
												        <option value="26">26</option>
												        <option value="27">27</option>
												        <option value="28">28</option>
												        <option value="29">29</option>
												        <option value="30">30</option>
												        <option value="31">31</option>
													</select>
												</div>
												
												<label style="width: 700px"><h2>성별</h2></label><br>
												<div class="col-4 col-12-small">
													<input type="radio" name="user_gender" id="user_gender"  value="남">
													<label for="demo-priority-low">남</label>
												</div>
												<div class="col-4 col-12-small">
													<input type="radio" name="user_gender" id="user_gender"  value="여" checked>
													<label for="demo-priority-normal">여</label>
												</div>
												<div class="col-12">
													<label><h2>핸드폰 번호</h2></label>
													<input type="text" name="user_phone"  placeholder="010-1234-5678" />
												</div>
												
												<div class="col-12">
													<label><h2>주소</h2></label>
													<input type="text" name="user_address" placeholder="서울시 송파구 중대로 135" />
												</div>
												
												<label style="width: 700px"><h2>선호 테마 카테고리</h2></label>
												<div class="col-4 col-12-xsmall">
													<select name="theme_no" id="theme_no">
														<option value="">-- 카테고리 --</option>
												        <option value="10">자연 / 힐링</option>
												        <option value="20">캠핑 & 펜션 </option>
												        <option value="30">로컬 핫 플레이스</option>
												        <option value="40">레저 / 스포츠</option>
												        <option value="50">맛집 & 카페</option>
												        <option value="60">박물관 & 유적지</option>
													</select>
												</div>
												
												<label style="width: 700px"><h2>프로필 사진 등록</h2></label><br>
											
												  <input type="file" name="user_photo" id="user_photo"> 

											 	<label style="width: 700px"></label><br>
						
												<div class="col-12">
													<ul class="actions">
														<li><button type="submit" class="primary" >회원 가입</button></li>
														<li><button type="reset" class="primary" >다시 쓰기</button></li>
													</ul>
												</div>
											</div>
										</form>
									</section>
									</section>
							</section>
					</div>
			</div><br><br>
        <script type="text/javascript">
        var checked_id = false;
        var checked_pw = false;

        $(function(){
        	$('#user_pw').keyup(function() {
        		$('#chkNotice').html('');
        	});
        	
        	$('#user_pw_chk').keyup(function() {
        		if($('#user_pw').val() != $('#user_pw_chk').val()) {
        			$('#chkNotice').html('비밀번호가 일치하지 않습니다<br/><br/>');
        			$('#chkNotice').attr('color', '#f82a2aa3');
        		} else {
        			$('#chkNotice').html('비밀번호가 일치합니다<br/><br/>');
        			$('#chkNotice').attr('color', '#199894b3');
        			checked_pw = true;
        		}
        	});
        });
		
      //preview image 
        var imgTarget = $('.preview-image .upload-hidden');

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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script>
		$(window).load(function () {
		    $('body').sakura();
		});
		</script>
        <!-- Core theme JS-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="resources/js/jquery-sakura.js"></script>
	</body>
</html>