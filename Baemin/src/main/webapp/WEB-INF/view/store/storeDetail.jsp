<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>  



 <div id="wrap">
    <nav>
    	<c:set var="info" value="${store.storeInfo }" />
        <h1 id="store_name" data-store_name="${info.storename }" >${info.storename }</h1>
        <%-- <div id="is_open" data-is_open="${store.storeInfo.isOpen }"></div> --%>
		<div class="inf">
			<div>
				<%-- 
				<span class="score_box">
             		<c:forEach begin="0" end="4" var="i">
             			<c:choose>
	           				<c:when test="${Math.round(info.score) > i }">
		                   		<i class="far fas fa-star"></i>
		                   	</c:when>
		                   	<c:otherwise>
		                   		<i class="far fa-star"></i>
		                   	</c:otherwise>
             			</c:choose> 
             		</c:forEach>
                  		
                  	<span class="store_score" data-score="${info.score }">${info.score }</span>
                  	
				</span><br>
                 --%>
                   
           		<span><i class="fas fa-heart" ></i> 찜 </span>
                   	
                    
                <span class="likes_count" data-count=0 >0</span>
                  
			</div>
               	<div>
               		<span class="store_review_count" data-review_count="0"> 리뷰 0</span>
               		<span>사장님 댓글 0</span>
            	</div>
                
               	<div id="min_delevery" data-min_delevery="${info.mindelevery }">최소주문금액 <fm:formatNumber value="${info.mindelevery }" pattern="###,###" />원</div>
               	<div>예상 배달시간 ${info.deleverytime  }분</div>
               	<div id="delevery_tip" data-delevery_tip="${info.deleverytip }">배달팁 <fm:formatNumber value="${info.deleverytip }" pattern="###,###" />원</div>
		</div>
    </nav>


	<!-- 모바일 카트 -->
   	<div class="m_cart_img">
   		<div class="m_cart_img_box">
   			<i class="fas fa-shopping-cart"></i>
   			<span class="m_cart_count"></span>
   		</div>
   	</div>
  	<!-- 모바일 카트 -->
    
    
    
	<!-- 장바구니 -->    
    <aside id="cart">
        <div class="cart">	
            <h2>장바구니</h2>
            <i class="far fa-trash-alt deleteAll" ></i>
            
            <div class="cart_list">
	            <ul>
	            	<!-- 
					<li>
						<h3>메뉴</h3>
  							<div>가격</div>
  							<div>수량 : 0 </div>
  							<div> 옵션  </div>
  							<div>합계 : 0원</div>
  							<button class="cancle_btn"> ｘ </button> 
		            </li>
  							-->
	            </ul>
            </div>
            
            <div class="order_btn_box">
            	<div class="total">장바구니가 비었습니다.</div>
	            <button class="order_btn" disabled>주문하기</button>
            </div>
        </div>
        
    </aside>
    <div class="alarm">장바구니에 담았습니다</div>
	<!-- 장바구니 -->    
	   

	<main>
		<div class="offset"></div>
        <ul class="tab ">
            <li class="select">메뉴</li>
            <li>정보</li>
            <li>리뷰</li>
        </ul>
	
			
		<!-- 메뉴 탭 -->	
        <ul class="menu">
			<c:forEach items="${store.foodList }" var="foodList" >
				<li>
					<c:if test="${adminPage && SPRING_SECURITY_CONTEXT.authentication.principal.user.role == 'ROLE_ADMIN' }">
						 <label class="menu_delete_label">
							 <i class="fas fa-check-square" ></i>
							 <input type="checkbox" class="menu_delete_checkbox" name="deleteNumber" value="${foodList.id }">
						 </label>
					 </c:if>
					 
					 <div class="menu_box">
						  <div>
						<h2>${foodList.foodName } </h2>
							  
								  <fm:formatNumber value="${foodList.foodPrice }" pattern="###,###" />원 
							  <input type="hidden" value="${foodList.storeId }" name="storeId" >
							<input type="hidden" value="${foodList.id }" name="foodId" class="food_id"   >
							<input type="hidden" value="${foodList.foodName }" name="foodName" class="food_name" >
							<input type="hidden" value="${foodList.foodPrice }" name="foodPrice" class="food_price"   >
							<input type="hidden" value="${foodList.foodDec }" name="foodDec" class="food_dec"   >
							<input type="hidden" value="${foodList.foodImg }" name="foodImg" class="food_img"   >
							<input type="hidden" value="${foodList.foodThumb }" name="foodThumb" class="food_thumb"   >
						 </div>
						 
						  <div><img src="${foodList.foodImg }" alt="이미지"></div>
					  </div>
				 </li>
		  </c:forEach>

        
        
        </ul>
		<!-- 메뉴 탭 -->	
		
		
		<!-- 정보 탭 -->
	    <ul class="info" >
			<li>
				<div>
					 <h2>찾아 오시는 길</h2>
					 
					 <div id="map_box">
						<body>
	
							<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
							<div id="map_wrap" class="map_wrap3">
								<div id="map_div"></div>
							</div>
							<div class="map_act_btn_wrap clear_box"></div>
							<p id="result"></p>
							
					
					</body>
						  
						 <!--  <div id="position_box">
								<button class="storePosition" ><i class="far fa-dot-circle"></i> 가게 위치로</button>
								<button class="userPosition"> <i class="far fa-dot-circle"></i> 내 위치로</button>
						  </div> -->
					 </div>
					 <br>
					 <h2>위치안내</h2>
					 <div id="store_address" data-address="${info.storeaddress2 }">${info.storeaddress2 }  ${info.storeaddress3 }</div>
				</div>
		  </li>
			
		  <li>
				<div>
					<h2>가게 소개</h2>
					<div>${info.storedes }</div>
			  </div>
		  </li>
			
		  <li>
				<div>
					 <h2>영업 정보</h2>
					 
					 <div class="info_detail_title">
						  <div>상호명</div>
						  <div>영업시간</div>
						  <div>전화번호</div>
						  
					 </div>
					 
					 <div class="info_detail">
						  <div>${info.storename }</div>
						  <div>
								<span><fm:formatNumber value="${info.openingtime }" minIntegerDigits="2" />시 ~</span>
								<span><fm:formatNumber value="${info.closingtime }" minIntegerDigits="2" />시 </span>
						  </div>
						  <div>${info.storephone }</div>
						  
					 </div>
				</div>
		  </li>
			
		  <li>
				<div>
					 <h2>가계 통계</h2>
					 <div class="info_detail_title">
						  <div>최근 주문수</div>
						  <div>전체 리뷰 수</div>
						  <div>찜</div>
					 </div>
					 
					 <div class="info_detail">
						  <%-- 
						  <div>${info.orderCount }</div>
						  <div>${info.reviewCount }</div>
						  <div>${info.likesCount }</div> 
						  --%>
					 </div>
				</div>	
		  </li>
		  
	    
	    
	       
	    </ul>
		<!-- 메뉴 탭 -->    
	
		
		
		<!-- 리뷰 탭 -->        
		<ul class="comment" >
	    
	    
	    
	        
		</ul>
	</main>
</div>

	
	<input type="hidden" value="${info.id }" id="store_id">
	<input type="hidden" value="${info.category }" id="store_category">  
	<input type="hidden" value="${info.openingtime }" id="store_opening_time"> 
	<input type="hidden" value="${info.closingtime }" id="store_closing_time"> 
	
	<input type="hidden" value="${BMaddress.address2 }" id="delevery_address">
	
	
			
				
	<script type="text/javascript">

		var map;
		var marker_s, marekr_e;
		
		//경로그림정보
		var drawInfoArr = [];
		
		$(document).ready(function(){


	
			// 1. 지도 띄우기
			map = new Tmapv2.Map("map_div", {
				
				center: new Tmapv2.LatLng(35.14174980544471, 126.92841873882824),
				width : "100%",
				height : "400px",
				zoom : 16,
				zoomControl : true,
				scrollwheel : true
			});
			
			// 시작, 도착 심볼찍기
			//  배달자 시작 위치입니다.
			marker_s = new Tmapv2.Marker({
				 
				position : new Tmapv2.LatLng(35.14106109876024, 126.92714737171818),
				icon : "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png" ,
				iconSize : new Tmapv2.Size(32, 38),
				map:map
			});
			
			// 도착 = 배달 종료 위치 입니다.
			marker_e = new Tmapv2.Marker({
				
				position : new Tmapv2.LatLng(35.141761287215914, 126.93182619326623),
				icon : "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png",
				iconSize : new Tmapv2.Size(34, 38),
				map:map
			});
			// 경유지 [ 가게 좌표 적기]
			marker = new Tmapv2.Marker({
				
				position : new Tmapv2.LatLng(35.13942237224968, 126.93085810192048),
				icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/market-128.png",
				iconSize : new Tmapv2.Size(32, 38),
				map:map
			});
			
			/* marker = new Tmapv2.Marker({
				position : new Tmapv2.LatLng(37.56568310756034, 127.00221495976581),
				icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
				iconSize : new Tmapv2.Size(24, 38),
				map:map
			});
			
			marker = new Tmapv2.Marker({
				position : new Tmapv2.LatLng(37.570369, 126.992153),
				icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
				iconSize : new Tmapv2.Size(24, 38),
				map:map
			});
			
			marker = new Tmapv2.Marker({
				position : new Tmapv2.LatLng(37.56335290252303, 127.00352387777271),
				icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_4.png",
				iconSize : new Tmapv2.Size(24, 38),
				map:map
			});
			
			marker = new Tmapv2.Marker({
				position : new Tmapv2.LatLng(37.570721714117965, 127.00186090818215),
				icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_5.png",
				iconSize : new Tmapv2.Size(24, 38),
				map:map
			});
			
			marker = new Tmapv2.Marker({
				position : new Tmapv2.LatLng(37.56515390827723, 126.99066536776698),
				icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_6.png",
				iconSize : new Tmapv2.Size(24, 38),
				map:map
			}); */
			
			var headers = {}; 
			headers["appKey"]="l7xxff49e6125e3442c69b6be1a8ff76c7ae";
			
			$.ajax({
				type:"POST",
				headers : headers,
				url:"https://apis.openapi.sk.com/tmap/routes/routeOptimization20?version=1&format=json",//
				async:false,
				contentType: "application/json",
				data: JSON.stringify({
						  "reqCoordType": "WGS84GEO",
						  "resCoordType" : "EPSG3857",
						  "startName": "출발",
						  
						  "startX": "126.92714737171818",
						  "startY": "35.14106109876024",
						  "startTime": "201711121314",
						  "endName": "도착",
						  
						  "endX": "126.93182619326623",
						  "endY": "35.141761287215914",
						  "searchOption" : "0",
						  "viaPoints": [
							 {

								"viaPointId": "test01",
								"viaPointName": "test01",
								
								"viaX": "126.93085810192048",
								"viaY": "35.13942237224968",
							 }/* ,
							 {
								"viaPointId": "test02",
								"viaPointName": "test02",
								"viaX": "127.00221495976581",
								"viaY": "37.56568310756034",
							 },
							 {
								"viaPointId": "test03",
								"viaPointName": "test03",
								"viaX": "126.992153",
								"viaY": "37.570369",
							 },
							 {
								"viaPointId": "test04",
								"viaPointName": "test04",
								"viaX": "127.00352387777271",
								"viaY": "37.56335290252303",
							 },
							 {
								"viaPointId": "test05",
								"viaPointName": "test05",
								"viaX": "127.00186090818215",
								"viaY": "37.570721714117965",
							 },
							 {
								"viaPointId": "test06",
								"viaPointName": "test06",
								"viaX": "126.99066536776698", 
								"viaY": "37.56515390827723",
							 } */
						  ]
				}),
				success:function(response){
					var resultData = response.properties;
					var resultFeatures = response.features;
					
					// 결과 출력
					var tDistance = "총 거리 : " + (resultData.totalDistance/1000).toFixed(1) + "km,  ";
					var tTime = "총 시간 : " + (resultData.totalTime/60).toFixed(0) + "분,  ";
					var tFare = "총 요금 : " + resultData.totalFare + "원";
					
					$("#result").text(tDistance+tTime+tFare);
					
					for(var i in resultFeatures) {
						var geometry = resultFeatures[i].geometry;
						var properties = resultFeatures[i].properties;
						var polyline_;
						
						drawInfoArr = [];
						
						if(geometry.type == "LineString") {
							for(var j in geometry.coordinates){
								// 경로들의 결과값(구간)들을 포인트 객체로 변환 
								var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
								// 포인트 객체를 받아 좌표값으로 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
								// 포인트객체의 정보로 좌표값 변환 객체로 저장
								var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
								
								drawInfoArr.push(convertChange);
							}
		
							polyline_ = new Tmapv2.Polyline({
								path : drawInfoArr,
								strokeColor : "#FF0000",
								strokeWeight: 6,
								map : map
							});
						}
					}
				},
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		
			
	});
		</script>