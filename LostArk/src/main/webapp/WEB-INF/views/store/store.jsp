<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<style>
.active {
	background: #ddd;
    color: #af8865; 
}

.container {
    width: 100%;
}


/* 콘텐츠 */
main {
   background: #fff; 
}

/* 상단 카테고리 */
.category{
    border-bottom: 1px solid #ddd;
    white-space: nowrap;
    overflow-x: auto;
    overflow-y: hidden; 
    padding: 15px 0;
    box-shadow: 0px 2px 3px 0px rgb(0 0 0 / 25%);
    margin: 0 auto;
    max-width: 1200px;
}

.category::-webkit-scrollbar {
    background: none;
}

.category li {
    font-size: 1.6rem;
	font-weight: bold;
    padding: 0 15px;
    display:inline;
    color: #ddd;
}

.category li > span{
	padding-bottom: 5px;
}

.category li:hover {
    color: #333333;
    cursor: pointer;
    transition: 0.1s;
}

/* 상단 카테고리 */


/* 상단 옵션 */
.option  { 
    font-size: 1.6rem;
    margin: 0 auto;
    margin-top: 10px;
    max-width: 1200px;
}
.option ul { 
    margin:20px 10px;
}

.option li { 
    display: inline;
    padding: 10px 20px;
    border-radius: 20px;
}

.option li:hover {  
   	background: #ddd;
    color: #af8865; 
    transition: 0.1s;
}

/* 상단 옵션 */


/* 가게 목록 */
/* 분리 */
/* 가게 목록 */


/* 콘텐츠 */




@media (max-width:1024px) {
	.container {
	    width: 100%;
	}
	
	.option  { 
	    white-space: nowrap;
	    overflow-x: auto;
	    overflow-y:hidden; 
	}
	
	.option::-webkit-scrollbar  { 
	    background:none;
	}
	
}


@media (max-width:767px) {
	
	.container {
	    width: 99%;
	}
	
	.category {
		padding: 10px 0;
		height: 25px;
	}
	
	.category li {
	    font-size: 15px;
	    padding: 10px 15px;
	}
	.option  { 
	   font-size: 13px;
	}
	
	.option ul { 
	    margin:10px;
	}
	
	
}





</style>
<link rel="stylesheet" href="/css/store/store.css">
<link rel="stylesheet" href="/css/store/store-li.css">

<%@ include file="/WEB-INF/views/include/header.jsp" %>


    <!-- 콘텐츠 -->
    <main>
        <div class="container"> <!-- home의 카테고리 받아오는거입니다. -->
            <div class="category" data-category="${category }">
                <ul>															<!-- 지번 주소 받아오는것 -->
                    <li data-category ='100' onclick="location.href='store/100/${address1 }'"><span>피자</span></li>
                    <li data-category ='101' onclick="location.href='store/101/${address1 }'"><span>치킨</span></li>
                    <li data-category ='102' onclick="location.href='store/102/${address1 }'"><span>패스트푸드</span></li>
                    <li data-category ='103' onclick="location.href='store/103/${address1 }'"><span>분식</span></li>
                    <li data-category ='104' onclick="location.href='store/104/${address1 }'"><span>카페/디저트</span></li>
                    <li data-category ='105' onclick="location.href='store/105/${address1 }'"><span>돈까스/일식</span></li>
                    <li data-category ='106' onclick="location.href='store/106/${address1 }'"><span>중국집</span></li>
                    <li data-category ='107' onclick="location.href='store/107/${address1 }'"><span>족발/보쌈</span></li>
                    <li data-category ='108' onclick="location.href='store/108/${address1 }'"><span>야식</span></li>
                    <li data-category ='109' onclick="location.href='store/109/${address1 }'"><span>한식</span></li>
                    <li data-category ='110' onclick="location.href='store/110/${address1 }'"><span>1인분</span></li>
                    <li data-category ='111' onclick="location.href='store/111/${address1 }'"><span>도시락</span></li>
                </ul>
            </div>

			<input type="hidden" value="${address1 }" class="address1">

           <div class="option">
                <ul>    
                	<li data-sort="기본순">기본순</li>
                    <li data-sort="배달 빠른 순">배달 빠른 순</li>
                    <li data-sort="배달팁 낮은 순">배달팁 낮은 순</li>
                    <li data-sort="별점 높은 순">별점 높은 순</li>
                    <li data-sort="리뷰 많은 순">리뷰 많은 순</li>
                    <li data-sort="최소 주문 금액 순">최소 주문 금액 순</li>
                </ul> 
           </div>
           
           

            <div class="box">
				
				<c:if test="${empty storeList }">
					<img class="temp_img" alt="이미지" src="/img/temp2.png">
					<style>main .box {background: #F6F6F6; max-width: 100%; }</style>
				</c:if>
				
				
                <ul class="store">
                	<c:set var="store_admin" value="/store" />
                	<c:forEach items="${storeList }" var="storeList">
                    	<%@ include file="/WEB-INF/views/store/store-li.jsp" %>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </main>
     <!-- 콘텐츠 -->
      
     
    <!-- 하단 메뉴 -->
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- 하단 메뉴 -->

    <!-- 푸터 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- 푸터 -->

	<script type="text/javascript" src="/js/store/store.js" ></script>
    
</body>
</html>