<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/link.jsp" %>
 
<link rel="stylesheet" href="/css/user/login.css">
<style>
@charset "UTF-8";

main {
	width: 70%;
	margin: 40px auto;
	border: 1px solid #ddd;
	border-radius: 15px;
	padding-bottom: 40px;
}
 
.login_box {
	margin: 0px auto;
	text-align: center;
}
 
.bm_img {
	width: 50%;
}
 
.login_box .input_aera {
	margin: 10px auto;
	width: 80%;
}
 
.login_box input {
	margin: 3px auto;
	width: 100%;
	height: 40px;
	padding: 0 2%;
	border: 1px solid #ddd;
	box-sizing: border-box;
}
 
.login_box .login_btn,
#login_btn  {
	background: #2AC1BC;
	border-radius: 10px;
	width: 80%;
	height: 45px;
	color: #fff;
	cursor: pointer;
	font-size: 1.8rem;
	font-weight: bold;
}
 
.login_box .box {
	display: flex;
	justify-content: space-between; 
	width: 80%;
	margin: 10px auto 40px auto;
}
 
.login_box .box .continue_login {
	direction: rtl;
}
 
.login_box .box i {
	font-size: 2rem;
	color: #999999;
}
 
input[type="checkbox"] {
	display: none;
}
input[type="checkbox"]:checked ~ i{
	color: #2AC1BC;
}
 
#oauth_login div {
	width: 300px;
	margin: 5px auto;
	height: 55px;
	border-radius: 5px;
	box-shadow: 0px 2px 3px 0px rgb(0 0 0 / 25%);
}
 
 
#oauth_login div a {
	display: block;
	width: 100%;
	height: 100%;
}
 
#oauth_login div:nth-child(1) a {
	background: url("/img/kakao_login_btn.png") no-repeat center;
	background-size: cover;	
	
}
 
#oauth_login div:nth-child(2) a {
	background: url("/img/naver_login_btn2.png") no-repeat center;
	background-size: cover;	
}
 
#oauth_login div:nth-child(3) a {
	background: url("/img/btn_google.png") no-repeat center;
	background-size: cover;	
}
 
.join {
	margin-top: 20px;
}
.join a {
	color: rgb(43,206,203);
	font-weight: bold;
	font-size: 1.8rem;
	margin-top: 20px;
}
 
@media ( max-width :1023px) {
	main {
		width: 90%;
	}
}
 
@media ( max-width : 767px ) {
	html {
		font-size: 58%;
	}
	
	main {
		width: 99%;
	}
	
	.login_box .input_aera {
		width: 90%;
	}
	
	.login_box .login_btn {
		width: 90%;
	}
	
	.login_box .box {
		width: 90%;
		margin: 10px auto;
	}
 
	#oauth_login {
		display: flex;
		width: 230px;
		margin: 0 auto;
	}
	#oauth_login div {
		width: 60px;
		height: 60px;
		border-radius: 5px;
		box-shadow: 0px 2px 3px 0px rgb(0 0 0 / 25%);
	}
 
	#oauth_login div:nth-child(1) a {
		background: url("/img/btn_kakao_m.png") no-repeat center;
		background-size: cover;
	}
	
	#oauth_login div:nth-child(2) a {
		background: url("/img/btn_naver_m.png") no-repeat center;
		background-size: cover;		
	}
	
	#oauth_login div:nth-child(3) a {
		background: url("/img/btn_google_m.png") no-repeat center;
		background-size: cover;
	}
 
	
}
 
@media (max-width: 480px) {
	html {
		font-size: 58%;
	}
	
}
</style>
</head>
<body>
	<main>
		<div class="login_box">
        	<a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
				<form action="/join" method="post" onsubmit="return isSubmit.isSubmit();">
					<div class="input_aera">
		            	<input type="text" name="mem_id" class="mem_id" autofocus maxlength="20" required placeholder="아이디를 입력해 주세요" >
						<span class="msg_box">${errorMsg.mem_id }</span>
	            	</div>          
		               
					<div class="input_aera">
						<input type="password" class="mem_pw1" name="mem_pw1" maxlength="20" required placeholder="비밀번호를 입력해 주세요">
					</div>
	               
					<div class="input_aera">
						<input type="password" class="mem_pw2" maxlength="20" required placeholder="비밀번호를 한번더 입력해 주세요">
			            <span class="msg_box">${errorMsg.mem_pw }</span>
	               	</div>
		               
	               	<div class="input_aera">
	               		<input type="text" name="mem_name" class="mem_name" required placeholder="이름을 입력해 주세요" >
		                <span class="msg_box">${errorMsg.mem_name }</span>
               		</div>
		               
					<div class="input_aera">
						<input type="text" class="nickname" name="nickname" maxlength="20"  placeholder="사용하실 닉네임을 입력해 주세요">
	               		<span class="msg_box">${errorMsg.nickname }</span>
					</div>
		               
					<div class="input_aera">
						<input type=number name="mem_phone" value="" class="mem_phone" placeholder="전화번호 '-' 없이 입력해 주세요" onkeypress="return lenthCheck(this, 11);" >
	                    <span class="msg_box">${errorMsg.mem_phone }</span>
	                </div>
	                
	                <div class="input_aera">
						<input type=number name="mem_addr" value="" class="mem_phone" placeholder="전화번호 '-' 없이 입력해 주세요" onkeypress="return lenthCheck(this, 11);" >
	                    <span class="msg_box">${errorMsg.mem_phone }</span>
	                </div>
	                
	                <div class="input_aera">
						<input type=number name="mem_phone" value="" class="mem_phone" placeholder="전화번호 '-' 없이 입력해 주세요" onkeypress="return lenthCheck(this, 11);" >
	                    <span class="msg_box">${errorMsg.mem_phone }</span>
	                </div>
	                
	                <div class="input_aera">
						<input type=number name="mem_phone" value="" class="mem_phone" placeholder="전화번호 '-' 없이 입력해 주세요" onkeypress="return lenthCheck(this, 11);" >
	                    <span class="msg_box">${errorMsg.mem_phone }</span>
	                </div>
	                
	               <input type="submit" value="회원가입" class="login_btn" >
			</form>
        </div>
    </main>
    
    <script src="/js/util/util.js"></script>
	<script type="text/javascript" src="/js/user/join.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
</body>
</html>