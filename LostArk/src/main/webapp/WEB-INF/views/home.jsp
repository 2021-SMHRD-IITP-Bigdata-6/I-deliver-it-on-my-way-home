<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	/* overflow-x: hidden;  */
	
}

.wrap {
	width: 95%;
	margin: 0 auto;
}

main {
	background: #fff;
	padding-bottom: 50px;
}

.address_search #search_box {
	width: 50%;
	height: 45px;
	background: #F6F6F6;
	border-radius: 10px;
	margin: 20px auto;
	display: flex;
}

.address_search #search_box input {
	font-size: 1.8rem;
}

.address_search #search_box>div:first-child {
	width: 90%;
}

.address_search .search_btn {
	width: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: auto;
}

.address_search .search_btn i {
	font-size: 1.8rem;
	color: #999999;
}

.address_search #deleveryAddress2 {
	height: 100%;
	width: 100%;
	padding-left: 10px;
	border: none;
	background: none;
}

.address_search #search_btn {
	display: none;
}

.category_box .box {
	max-width: 1000px;
	width: 90%;
	margin: 0 auto;
	padding-top: 30px;
}

.category {
	display: flex;
	flex-wrap: wrap;
}

.category  li {
	width: 17%;
	margin: 1% 1.5% 3%;
	cursor: pointer;
	font-weight: 600;
}

.category li>div {
	overflow: hidden;
	border-radius: 10px;
}

.category li .img_box {
	width: 100%;
	height: 0;
	padding-bottom: 100%;
	position: relative;
	overflow: hidden;
}

.category li .img_box img {
	width: 100%;
	height: 100%;
	position: absolute;
	object-fit: cover;
	transition: 0.3s;
}

.category li .img_box img:hover {
	transform: scale(1.05);
}

.category li .name {
	text-align: center;
	font-size: 1.6rem;
}

@media ( max-width :1023px) {
	.address_search #search_box {
		width: 50%;
		height: 45px;
	}
	.category_box .box {
		width: 95%;
	}
}

@media ( max-width :767px) {
	.address_search #search_box {
		width: 75%;
	}
	.category_box .box {
		width: 100%;
	}
}

@media ( max-width :480px) {
	.address_search #search_box {
		width: 90%;
	}
}
/* 하단 메뉴 */
nav {
	height: 80px;
	border-top: 1px solid #ccc;
	position: sticky;
	bottom: 0;
	z-index: 1;
	background: #fff;
}

nav ul {
	display: flex;
	justify-content: space-around;
	padding-top: 10px;
	width: 80%;
	max-width: 1200px;
	margin: 0 auto;
}

nav ul li a {
	display: block;
	width: 60px;
	height: 60px;
	transition: 0.1s;
}

nav ul li:nth-child(1) a {
	background: url("/img/nav1.png");
	background-size: cover;
}

nav ul li:nth-child(2) a {
	background: url("/img/nav2.png");
	background-size: cover;
}

nav ul li:nth-child(3) a {
	background: url("/img/nav3.png");
	background-size: cover;
}

nav ul li:nth-child(4) a {
	background: url("/img/nav4.png");
	background-size: cover;
}

nav ul li:nth-child(5) a {
	background: url("/img/nav5.png");
	background-size: cover;
}

nav ul li a:hover {
	transform: scale(1.15);
}

@media ( max-width :1023px) {
	nav ul {
		width: 100%;
	}
}

@media ( max-width :767px) {
	nav {
		height: 65px;
	}
	nav ul li a {
		display: block;
		width: 45px;
		height: 45px;
	}
}

/* 하단 메뉴 */
@charset "UTF-8";

body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset,
	legend, p, select, table, th, td, tr, textarea, button, form {
	margin: 0;
	padding: 0;
}

html {
	font-size: 62.5%
}

input, button, textarea {
	border-radius: 10px;
}

/*  a 링크 초기화 */
a {
	color: #222;
	text-decoration: none;
}

a:hover {
	color: #390;
}

/* 인풋 number 화살표 업애기 */
input[type="number"]::-webkit-outer-spin-button, 
input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
}
/* 스윗 얼럿 */
.swal-footer {
	text-align: center;
}

.swal-button.swal-button--confirm {
	background: #2AC1BC;
	color: #fff;
}

.swal-button.swal-button--cancel {
	background: #fff;
	color: #333333;
	border: 1px solid #ddd;
}
/* 스윗 얼럿 */
h1, h2 {
	/* font-weight: bold; */
	
}

h1 {
	font-size: 2.4rem;
}

h2 {
	font-size: 2rem;
}

h3 {
	font-weight: bold;
	font-size: 1.8rem;
}

i {
	cursor: pointer;
}

button, input[type="submit"], input[type="button"] {
	cursor: pointer;
}

/* 크기 변경 x */
textarea {
	resize: none;
}

/* 폰트 초기화 */
body, input, textarea, select, button, table {
	/* font-family: AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif;  */
	font-family: 'Jua', sans-serif;
	color: #222;
	font-size: 1.6rem;
	line-height: 1.5;
}
/* 폰트 초기화 */

/* 불릿기호 초기화 */
dl, ul, ol, li, menu {
	list-style: none;
}


input:focus {
	outline: none;
}

select{
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border-radius: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
}



@media ( max-width :767px) {
	html {
		font-size: 56%;
	}
}

@media ( max-width :480px) {
	html {
		font-size: 45%;
	}
}

@media ( max-width :767px) {
	input[type="submit"], input[type="button"], textarea, button, select {
		appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
		border-radius: 0;
		-webkit-border-radius: 0;
		-moz-border-radius: 0;
	}
}
header {
	width: 100%;
	height: 80px;
	background: #2AC1BC;
	position: relative;
}

#header {
	width: 1200px;
	margin: 0 auto;
}

header img {
	width: 160px;
}

.menu_tab_box {
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}


.menu_tab, 
.menu_tab span {
	display: inline-block;
	transition: all 0.4s;
	box-sizing: border-box;
}

.menu_tab {
	position: relative;
	width: 24px;
	height: 18px;
	display: none;
	cursor: pointer;
}

.menu_tab span {
	position: absolute;
	left: 0;
	width: 100%;
	height: 2px;
	background-color: #fff;
	border-radius: 4px;
}

.menu_tab span:nth-of-type(1) {
	top: 0;
}

.menu_tab span:nth-of-type(2) {
	top: 50%;
	transform: translateY(-50%);
}

.menu_tab span:nth-of-type(3) {
	bottom: 0;
}

.menu_tab.active span:nth-of-type(1) {
	transform: translateY(8px) rotate(-45deg);
}

.menu_tab.active span:nth-of-type(2) {
	opacity: 0;
}

.menu_tab.active span:nth-of-type(3) {
	transform: translateY(-8px) rotate(45deg);
}

@media ( max-width :1250px) {
	#header {
		width: 99%;
	}
}

@media ( max-width :767px) {
	header img {
		width: 120px;
		position: relative;
		left: -15px;
	}
	header {
		height: 60px;
	}
}
/* -------------  푸터 ------------- */




footer {
    background-color:#2AC1BC;
    height: 130px;
    font-size: 13px;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
}

footer .box {
	width : 1200px;
	height: 80px;
}

/* -------------  푸터 ------------- */


@media (min-width:768px) and (max-width:1023px) {
}
@media  (max-width:767px) {
	footer {
		height: 100px; 
	}
	
	footer .box {
		width : 90%;
	}

}
</style>


<%@ include file="/WEB-INF/views/include/link.jsp" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 콘텐츠 -->
<div class="wrap">
	<main>
		<section class="address_search">
			<div id="search_box">
				<div>
					<input type="hidden" id="deleveryAddress1" placeholder="우편번호"
						value="${BMaddress.address1 }" name="address1" readonly> <input
						type="text" value="${BMaddress.address2 }" id="deleveryAddress2"
						readonly placeholder="주소를 입력해 주세요" name="address2"><br>
				</div>

				<div class="search_btn">
					<label for="search_btn"> <i class="fas fa-search"></i>
					</label> <input type="button" name="search" id="search_btn">

				</div>

			</div>
		</section>
		<section class="category_box">
			<div class="box">
				<ul class="category">

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/pizza2.png" alt="이미지">
							</div>
						</div>
						<div class="name">피자</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/chicken1.png" alt="이미지">
							</div>
						</div>
						<div class="name">치킨</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/hamburger4.png" alt="이미지">
							</div>
						</div>
						<div class="name">패스트푸드</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/bunsik1.png" alt="이미지">
							</div>
						</div>
						<div class="name">분식</div>
					</li>


					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/dessert2.png" alt="이미지">
							</div>
						</div>
						<div class="name">카페/디저트</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/cutlet1.png" alt="이미지">
							</div>
						</div>
						<div class="name">돈까스/일식</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/chinese1.png" alt="이미지">
							</div>
						</div>
						<div class="name">중국집</div>
					</li>


					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/jockbal1.png" alt="이미지">
							</div>
						</div>
						<div class="name">족발/보쌈</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/jockbal2.png" alt="이미지">
							</div>
						</div>
						<div class="name">야식</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/bibimbap.jpg" alt="이미지">
							</div>
						</div>
						<div class="name">한식</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/jockbal3.png" alt="이미지">
							</div>
						</div>
						<div class="name">1인분</div>
					</li>

					<li>
						<div>
							<div class="img_box">
								<img src="resources/img/dosirac.jpg" alt="이미지">
							</div>
						</div>
						<div class="name">도시락</div>
					</li>
				</ul>
			</div>
		</section>
	</main>
</div>
<!-- 콘텐츠 -->


<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!-- 하단 메뉴 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- 푸터 -->

<script>
	$(".category li").click(function(){
		let address1 = $("#deleveryAddress1").val();
		if(!address1) {
			swal("배달 받으실 주소를 입력해 주세요");
			return false;
		}
		
		const index = $(this).index();
		
		location.href = "/store/" + (100+index) + "/" +address1;
	})
 
</script>


</body>

</html>