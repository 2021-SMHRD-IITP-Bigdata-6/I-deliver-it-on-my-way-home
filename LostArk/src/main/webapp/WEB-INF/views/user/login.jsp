<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
 
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
    <main>
        <div class="login_box">
			<a href="/"><img src="resources/img/bamin2.png" alt="이미지" class="bm_img"></a>    
            
            <form action="/login" method="post">
 
	            <div class="input_aera"><input type="text" name="username"  value="" required placeholder="이메일을 입력해 주세요" maxlength="30" ></div>
	            <div class="input_aera"><input type="password" name="password" value="" required placeholder="비밀번호를 입력해 주세요" maxlength="30"></div>
 
				<input type="submit" value="로그인" class="login_btn" >
            
				<div class="box">
					<div class="continue_login">
						<label for="continue_login"> 
							<span>로그인 유지하기</span>
							<input type="checkbox" id="continue_login" name="remember-me" > 
							<i class="fas fa-check-square"></i>
						</label>
					</div>
					
		            <div>
		            	<span class="id_search"><a href="/find/id">아이디</a></span>
			            <span> ㅣ </span>
			            <span><a href="/find/password">비밀번호 찾기</a></span>
		            </div>
	            </div>
            </form>
            
			<div id="oauth_login">
				<div>
					<a href="/oauth2/authorization/kakao"></a>
				</div>
 
				<div>
					<a href="/oauth2/authorization/naver"></a>
				</div>
				
				<div>
					<a href="/oauth2/authorization/google"></a>
				</div>
			</div>
			
			<div class="join"><a href="join" >회원 가입하러 가기</a></div>
        </div>
    </main>
    
    
</body>
</html>