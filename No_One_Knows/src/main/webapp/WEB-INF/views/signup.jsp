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
      	
        <!-- Page Content-->
        <header style="background: linear-gradient( to bottom, white, rgba( 182, 222, 255, 0.1 ) );">
	        <div class="container">
		       <section class="container mt-3" style="max-width: 560px;">
					<form method="post" style="display: block; margin-top: 30px;">
						<div class="scale"><img src = "resources/img/hot.png" style="width: 110px; height:110px; display: block; margin: 0px auto;"></div>
						<div class="form-group">
							<label>아이디</label>
							<input type="text" name="user_id" class="form-control">		
						</div>
						<div class="form-group">
							<label>이름</label>
							<input type="text" name="user_name" class="form-control">		
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" name="user_pw" class="form-control">
						</div>
						<div class="form-group">
							<label>이메일</label>
							<input type="email" name="user_email" class="form-control" placeholder="aaa@gmail.com">
						</div>
						<div class="form-group">
							<label>성별</label><br>
							<input type = "radio" name = "user_gender" id = "user_gender" value="남"/> 남
    						&nbsp;&nbsp;&nbsp;<input type = "radio" name = "user_gender" id = "user_gender" value="여"/> 여
						</div>
						<div class="form-group">
							<label>생년월일</label><br>
							<select name="user_age" id="user_age" style="height:30px; font-size:15px; border: 1px solid #ECEBFF; border-radius: 16%">
						        <option value="">-- 년도 --</option>
						        <option value="1993">1993</option>
						        <option value="1995">1994</option>
						        <option value="1995">1995</option>
						        <option value="1996">1996</option>
						        <option value="1997">1997</option>
						        <option value="1998">1998</option>
						      </select>
						      &nbsp;&nbsp;<select name="month" style="height:30px; font-size:15px; border: 1px solid #ECEBFF; border-radius: 16%">
						        <option value="">-- 월 --</option>
						        <option value="1">1</option>
						        <option value="2">2</option>
						        <option value="3">3</option>
						        <option value="4">4</option>
						        <option value="5">5</option>
						        <option value="6">6</option>
						        <option value="7">7</option>
						        <option value="8">8</option>
						        <option value="9">9</option>
						        <option value="10">10</option>
						        <option value="11">11</option>
						        <option value="12">12</option>
						      </select>
						      &nbsp;&nbsp;<select name="day" style="height:30px; font-size:15px; border: 1px solid #ECEBFF; border-radius: 16%">
						        <option value="">-- 일 --</option>
						        <option value="1">1</option>
						        <option value="2">2</option>
						        <option value="3">3</option>
						        <option value="4">4</option>
						        <option value="5">5</option>
						        <option value="6">6</option>
						        <option value="7">7</option>
						        <option value="8">8</option>
						        <option value="9">9</option>
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
						<div class="form-group">
							<label>핸드폰 번호</label><br>
							<input type="text" name="user_phone" placeholder="010-****-****" class="form-control">
						</div>
						<div class="form-group">
							<label>주소</label><br>
							<input type="text" name="user_address" placeholder="서울시 송파구 중대로 135" class="form-control">
						</div>
						<div class="form-group">
							<label>선호하는 여행 테마</label><br>
							<input type = "radio" name = "theme_no" id="theme_no" value="10"/> 테마1
    						&nbsp;&nbsp;&nbsp;<input type = "radio" name = "theme_no" id="theme_no" value="20"/> 테마2
    						&nbsp;&nbsp;&nbsp;<input type = "radio" name = "theme_no" id="theme_no" value="30"/> 테마3
    						&nbsp;&nbsp;&nbsp;<input type = "radio" name = "theme_no" id="theme_no" value="40"/> 테마4
    						&nbsp;&nbsp;&nbsp;<input type = "radio" name = "theme_no" id="theme_no" value="50"/> 테마5
						</div><br>
						<div class="tscale"><button type="submit" class="btn"  style="background: linear-gradient( to left, #FAED7D, #FFCD12 ); color:white; display: block; margin: 0px auto;">회원가입</button></div>
					</form>
				</section><br><br><br>
	        </div>
	    </header>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
	</body>
</html>