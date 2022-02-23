<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/myPage.css">
<style>
section.title {
    width: 100%;
}
 
section.title h1 {
    text-align: center;
    margin : 30px 0 30px 0 ;
}
 
/* 콘텐츠 */
 
main {
	/* min-height: 390px; */
}
 
main .container {
    max-width: 1200px;
    margin: 0 auto;
}
 
main .container .grid_box {
	margin: 0 auto 30px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 75px 1fr 1fr;
	width: 67%;
	text-align: center;
	border-right: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}
 
main .container .grid_box > div {
	border: 1px solid #ddd; 
	border-bottom: none;
	border-right: none;
}
 
main .container .grid_box .login_box {
    grid-column-end: span 3;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px; 
}
 
main .container .grid_box .login_box span {
	display: inline;
}
 
main .container .grid_box .login_box a {
	font-size: 2rem;
	font-weight: bold
}
	
main .container .grid_box .login_box a:after {
	content: '>';
	color: rgb(202, 198, 198);
	margin-left: 5px;
}
 
main .container .grid_box .login_box .logout {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 1.5rem;
}
 
main .container .grid_box > div a span:last-child {
	padding-bottom: 15px;
	margin-top: -10px;
}
 
main .container .grid_box > div a span {
	display: block;
}
 
main .container .grid_box > div img {
	width: 130px;
}
 
 
@media (max-width:1023px) {
	main .container .grid_box {
		width: 80%;
	}
}
@media  (max-width:767px) {
	.wrap {
		min-height: calc(100vh - 277px);
	}
	
	main .container .grid_box {
		width: 90%;
		grid-template-rows: 50px 1fr 1fr;
	}
	
	main .container .grid_box > div img {
	    width: 100px;
	} 
}
 
 
@media  (max-width:480px) {
	.wrap {
		min-height: calc(100vh - 274px);
	}
	main .container .grid_box {
		width: 99%;
	}
	
	main .container .grid_box > div img {
	    width: 80px;
	} 
	
}</style>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
 
	<div class="wrap"> 
 
	    <section class="title">
	        <h1>my 배민</h1> 
	    </section>
			
	    <!-- 콘텐츠 -->
	    <main>
	    	<div class="container">
	    	
		    	<div class="grid_box">
		    		<div class="login_box">
	    				 <c:if test="${empty SPRING_SECURITY_CONTEXT }">
	                         <a href="/login"><span>로그인을 해주세요</span></a>
	                    </c:if>
	                    
	                    
	                    <c:if test="${!empty SPRING_SECURITY_CONTEXT }">
                            <c:set var="nickname" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname }" />
	                        <a href="/user/myInfo"><span class="nickname" data-nickname=${nickname } >${nickname }</span></a>
							<button type="button" class="logout">로그아웃</button>
	                    </c:if>
		    		</div>
		    		
		    		
		    		<div>
		    			<a href="/user/point" onclick="return loginCheck();">
	                       	<span class="img_box">
	                       		<img src="resources/img/icon11.png" alt="포인트">
	                       	</span>
	                       	<span>포인트</span>
	                  	</a>
		    		</div>
		    		
		    		
		    		<div>
		    			<a class="updating" href="/myPage/coupon" onclick="return false;">
	               		  	<span class="img_box">
	                			<img src="resources/img/icon22.png" alt="쿠폰함">
	               			</span>
	               			<span>쿠폰함</span>
	              		</a>
		    		</div>
		    		
		    		
		    		<div>
		    			<a class="updating" href="/myPage/gift" onclick="return false;">
	                 		<span class="img_box">
	                 			<img src="resources/img/icon33.png" alt="선물함">
	                 		</span>
	                        <span>선물함</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/likes/store">
							<span class="img_box">
								<img src="resources/img/icon44.png" alt="찜한가게">
							</span>
							<span>찜한가게</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/orderList">
							<span class="img_box">
								<img src="resources/img/icon55.png" alt="주문내역">
							</span>
							<span>주문내역</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/user/myReview" onclick="return loginCheck()" >
							<span class="img_box">
								<img src="resources/img/icon66.png" alt="리뷰관리">
							</span>
							<span>리뷰관리</span>
						</a>
		    		</div>
		    		
		    	</div>
	    		
	    	</div>
	    </main>
	    
    </div>
    
    <!-- 콘텐츠 -->
 
 
    <!-- 하단 메뉴 -->
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- 하단 메뉴 -->
 
    <!-- 푸터 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- 푸터 -->
 
    <script type="text/javascript">
 
        $(".updating").click(function () {
            swal("업데이트 준비 중 입니다");
        })
 
        $(".logout").click(function () {
            location.href = "/logout";
        })
        
        function loginCheck(){
        	const nickname = $(".nickname").data("nickname");
        	if(!nickname) {
        		swal("로그인 후 이용 가능합니다");
	        	return false;
        	}
        	return true;
        	
        }
        
    </script>
 
</body>
 
</html>