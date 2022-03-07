<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<li>
		<div class="img_box">
			<a href="${store_admin}/detail/${storeList.store_id }"><img src="${storeList.store_img}" alt="이미지"></a>
		</div>
		<script>console.log("${storeList.store_id }")</script>
		
		<div class="info_box">
		
			<h2><a href="${store_admin}/detail/${storeList.store_id}">${storeList.store_name}</a></h2>
			
			<a href="${store_admin}/detail/${storeList.store_id}">
				<span>
				
				</span>
				
			<span>
		
			</span>
			
			<span>
				<span>최소주문금액 <fm:formatNumber value="${storeList.min_delevery}" pattern="###,###" />원</span>
				<span>배달팁 <fm:formatNumber value="${storeList.delevery_tip}" pattern="###,###" />원</span>
			</span>
			<span>배달시간 ${storeList.delevery_time}분</span>
			</a>
		</div>
		
		<%-- 
	<c:if test="${!storeList.isOpen}">
		<div class="is_open">
			<a href="/store/detail/${storeList.store_id}">지금은 준비중입니다</a>
		</div>
	</c:if>
	 --%>
</li>
