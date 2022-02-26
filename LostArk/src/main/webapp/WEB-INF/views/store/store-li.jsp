<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <style>



.box .fas {
	color: gold;
}

.box {
 	margin: 0 auto;
    max-width: 1200px;
}

.box .temp_img {
	display: block;
	margin: 0 auto;
	width:90%;
	max-width: 500px;
}


.box .store {
    display: flex;
    flex-wrap: wrap;
}

.box .store li {
	display: flex;
	border: 1px solid #ddd;
	width: 47%;
	margin: 15px;
	padding: 20px 15px;
	box-sizing: border-box;
	border-radius: 10px;
	position: relative;
	overflow: hidden;
}


.box .store li .img_box {
	margin-right: 10px;
	border: 1px solid #ddd;
	width: 130px;
	height: 130px;
	border-radius: 10px;
	overflow: hidden;
}

.box .store li .img_box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.box .store li .img_box img:hover {
	transform: scale(1.05);
	transition: 0.1s;
}

.box .store li .info_box {
	overflow: hidden;
	flex: 1;
}


.box .store li .info_box h2 a {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}


.box .store li .info_box a > span {
	display: block;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.store .is_open {
	background: rgba(0,0,0,0.7);
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    border-radius:10px;
    font-size: 1.8rem;
}
.store .is_open a{
    color: #fff;
    display: flex;
	justify-content: center;
	align-items: center;
	height: 100%; 
}

/* 가게 목록 */



@media (max-width:1024px) {
	.box .store {
		background: #eee;
	}
	.box .store li {
	    width: 100%;
	    border:none;
	    border-radius: 0;
	    border-bottom: 2px solid #ddd;
	    margin: 0 auto 10px;
	    background: #fff;
	}
	
	.store .is_open {
		border-radius: 0;
	}
}


@media (max-width:767px) {
	.box .store li .img_box {
		width: 100px;
		height: 100px;
	}
}

@media (max-width:480px) {
	.box .store li {
		padding: 20px 10px;
	}
	
	.box .store li .img_box {
		width: 80px;
		height: 80px;
	}
}

</style>
<li>
		<%-- <a href="${store_admin }/detail/${storeList.id }"> --%>
		
		<div class="img_box">
			<a href="${store_admin }/detail/${storeList.id }"><img src="${storeList.storeImg }" alt="이미지"></a>
		</div>

		<div class="info_box">
		
			<h2><a href="${store_admin }/detail/${storeList.id }">${storeList.storeName }</a></h2>
			
			 <a href="${store_admin }/detail/${storeList.id }">
				<span>
					<%-- <span>평점 ${storeList.score }</span>
					
					<span class="score_box">
						<c:forEach begin="0" end="4" var="i">
							<c:if test="${Math.round(storeList.score) > i }">
								<i class="far fas fa-star"></i>
							</c:if>
							<c:if test="${Math.round(storeList.score) <= i }">
								<i class="far fa-star"></i>
							</c:if>
						</c:forEach>
					</span> --%>
				</span>
				
			<span>
			<%-- 
				<span>리뷰 ${storeList.reviewCount }</span>
				<span>사장님 댓글 ${storeList.bossCommentCount }</span>
				 --%>
			</span> 
			
			<span>
				<span>최소주문금액 <fm:formatNumber value="${storeList.minDelevery }" pattern="###,###" />원</span>
				<span>배달팁 <fm:formatNumber value="${storeList.deleveryTip }" pattern="###,###" />원</span>
			</span>
			<span>배달시간 ${storeList.deleveryTime }분</span>
			</a>
		</div>
		
		
	<c:if test="${!storeList.isOpen}">
		<div class="is_open">
			<a href="/store/detail/${storeList.id }">지금은 준비중입니다</a>
		</div>
	</c:if>
</li>