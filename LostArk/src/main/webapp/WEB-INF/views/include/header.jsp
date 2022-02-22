<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
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
header .admin_page_btn {
	font-size: 13px;
	position: absolute;
	right: 10px;
	top: 10px;
	font-weight: bold;
}

header .admin_page_btn a {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 5px;
	background: #fff;
	font-size: 13px;
	display: block;
}
</style>

</head>
<body >
	<!-- <body> -->


	<header>
		<div id="header">
			<a href="/"><img src="resources/img/baemin.jpg" alt="이미지"> </a>

			<c:if test="${SPRING_SECURITY_CONTEXT != null }">
				로그인중			
			</c:if>

			<!-- 임시 -->
			<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'ROLE_ADMIN' }"> 
			<div class="admin_page_btn">
				<div>
					<a href="/admin/main">사장님 페이지</a>
				</div>
			</div>
			</c:if>
			<!-- 임시 -->
			
			<div class="menu_tab_box active">
				<div class="menu_tab">
					<span> </span>
					<span> </span>
					<span> </span>
				</div>
			</div>

		</div>
	</header>
	<!-- 헤더 -->
 

