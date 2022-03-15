<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>

<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>
<script type="text/javascript">
	var map;
	var marker_s, marker_e, marker_p1, marker_p2;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];
	// 페이지가 로딩이 된 후 호출하는 함수입니다.
	function initTmap(){
		// map 생성
		// Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		 map = new Tmapv2.Map("map_div",  
				{
				center: new Tmapv2.LatLng(35.14174980544471, 126.92841873882824),
				width : "100%",
				height : "700px",
				zoom : 16,
				zoomControl : true,
				scrollwheel : true
			});
		//시작 = 배달 시작 위치 입니다.
		marker_s = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(35.14106109876024, 126.92714737171818),
                 icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png" ,
                 iconSize : new Tmapv2.Size(24, 38),
				 draggable : true,
                 map:map
		});
		// 도착 = 배달 종료 위치 입니다.
		marker_e = new Tmapv2.Marker({
                 
                 position : new Tmapv2.LatLng(35.141761287215914, 126.93182619326623),
                 icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
                 iconSize : new Tmapv2.Size(24, 38),
				 draggable : true,
                 map:map
             });
				marker_r = new Tmapv2.Marker({
                 
                 position : new Tmapv2.LatLng(35.13942237224968, 126.93085810192048),
                 icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/market-128.png",
                 iconSize : new Tmapv2.Size(32, 35),
                 map:map
             });
            
				$.ajax({
					method : "POST",
					url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
					async : false,
					data : {
						"appKey" : "l7xxf0b20425767d4229b30712708501d2c7",
						"startX" : "126.92714737171818",
						"startY" : "35.14106109876024",
						"endX" : "126.93182619326623",
						"endY" : "35.141761287215914",
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지"
						
						
					},
					
					success : function(response) {
						var resultData = response.features;

						//결과 출력
						var tDistance = "총 거리 : "
								+ ((resultData[0].properties.totalDistance) / 1000)
										.toFixed(1) + "km,";
						var tTime = " 총 시간 : "
								+ ((resultData[0].properties.totalTime) / 60)
										.toFixed(0) + "분";

						$("#result").text(tDistance + tTime);
						
						//기존 그려진 라인 & 마커가 있다면 초기화
						if (resultdrawArr.length > 0) {
							for ( var i in resultdrawArr) {
								resultdrawArr[i]
										.setMap(null);
							}
							resultdrawArr = [];
						}
						
						drawInfoArr = [];

						for ( var i in resultData) { //for문 [S]
							var geometry = resultData[i].geometry;
							var properties = resultData[i].properties;
							var polyline_;


							if (geometry.type == "LineString") {
								for ( var j in geometry.coordinates) {
									// 경로들의 결과값(구간)들을 포인트 객체로 변환 
									var latlng = new Tmapv2.Point(
											geometry.coordinates[j][0],
											geometry.coordinates[j][1]);
									// 포인트 객체를 받아 좌표값으로 변환
									var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											latlng);
									// 포인트객체의 정보로 좌표값 변환 객체로 저장
									var convertChange = new Tmapv2.LatLng(
											convertPoint._lat,
											convertPoint._lng);
									// 배열에 담기
									drawInfoArr.push(convertChange);
								}
							} else {
								var markerImg = "";
								var pType = "";
								var size;

								if (properties.pointType == "S") { //출발지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
									pType = "S";
									size = new Tmapv2.Size(24, 38);
								} else if (properties.pointType == "E") { //도착지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
									pType = "E";
									size = new Tmapv2.Size(24, 38);
								} else { //각 포인트 마커
									markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
									pType = "P";
									size = new Tmapv2.Size(8, 8);
								}

								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlon = new Tmapv2.Point(
										geometry.coordinates[0],
										geometry.coordinates[1]);

								// 포인트 객체를 받아 좌표값으로 다시 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
										latlon);

								var routeInfoObj = {
									markerImage : markerImg,
									lng : convertPoint._lng,
									lat : convertPoint._lat,
									pointType : pType
								};

								// Marker 추가
								marker_p = new Tmapv2.Marker(
										{
											position : new Tmapv2.LatLng(
													routeInfoObj.lat,
													routeInfoObj.lng),
											icon : routeInfoObj.markerImage,
											iconSize : size,
											map : map
										});
							}
						}//for문 [E]
						drawLine(drawInfoArr);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});

	}

	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	function drawLine(arrPoint) {
		var polyline_;

		polyline_ = new Tmapv2.Polyline({
			path : arrPoint,
			strokeColor : "#DD0000",
			strokeWeight : 6,
			map : map
		});
		resultdrawArr.push(polyline_);
	}
		 
			 
		//Marker에 클릭이벤트 등록.
//		marker.addListener("click", function(evt) {
//			document.getElementById("result").innerHTML = 'Mouse Click!';
//		});
		//Marker에 우클릭이벤트 등록
//		marker.addListener("contextmenu", function(evt) {
//			document.getElementById("result").innerHTML = 'Mouse contextmenu!';
//		});
		//Marker에 마우스가 마커 영역에 들어왔을때 이벤트 등록.
		marker_s.addListener("mouseenter", function(evt) {
			document.getElementById("result").innerHTML = '좌표는'+marker_s.getPosition();
			marker_s.getPosition();
		});
		//Marker에 마우스가 마커를 벗어났을때 이벤트 등록.
		marker_s.addListener("mouseleave", function(evt) {
			document.getElementById("result").innerHTML = '';
		});
		
		//Marker draggable: true일때, 마커가 움직일때 이벤트 등록
		marker_s.addListener("drag", function (evt) {
			console.log("drag="+evt.latLng);
		});
		//Marker draggable: true일때, 마커의 움직임이 끝날때 이벤트 등록
		marker_s.addListener("dragend", function (evt) {
			console.log("dragend="+evt.latLng);
		});
		
		//모바일상에서 Marker draggable: true일때, 마커 터치를 시작할때 이벤트 등록
		marker_s.addListener("touchstart", function (evt) {
			console.log("touchstart="+evt.latLng);
		});
		//모바일상에서 Marker draggable: true일때, 마커 터치가 끝날때 이벤트 등록
		marker_s.addListener("touchend", function (evt) {
			console.log("touchend="+evt.latLng);
		});
		//모바일상에서 Marker draggable: true일때, 마커 터치 후 움직일때 이벤트 등록
		marker_s.addListener("touchmove", function (evt) {
			console.log("touchmove="+evt.latLng);
			});
			
		// 	//Marker에 클릭이벤트 등록.
		// marker1.addListener("click", function(evt) {
		// 	document.getElementById("result").innerHTML = 'Mouse Click!';
		// });
		// //Marker에 우클릭이벤트 등록
		// marker1.addListener("contextmenu", function(evt) {
		// 	document.getElementById("result").innerHTML = 'Mouse contextmenu!';
		// });
		//Marker에 마우스가 마커 영역에 들어왔을때 이벤트 등록.
		marker_e.addListener("mouseenter", function(evt) {
			document.getElementById("result").innerHTML = '좌표는'+marker_e.getPosition();
			marker_e.getPosition();
		});
		//Marker에 마우스가 마커를 벗어났을때 이벤트 등록.
		marker_e.addListener("mouseleave", function(evt) {
			document.getElementById("result").innerHTML = '';
		});
		
		//Marker draggable: true일때, 마커가 움직일때 이벤트 등록
		marker_e.addListener("drag", function (evt) {
			console.log("drag="+evt.latLng);
		});
		//Marker draggable: true일때, 마커의 움직임이 끝날때 이벤트 등록
		marker_e.addListener("dragend", function (evt) {
			console.log("dragend="+evt.latLng);
		});
		
		//모바일상에서 Marker draggable: true일때, 마커 터치를 시작할때 이벤트 등록
		marker_e.addListener("touchstart", function (evt) {
			console.log("touchstart="+evt.latLng);
		});
		//모바일상에서 Marker draggable: true일때, 마커 터치가 끝날때 이벤트 등록
		marker_e.addListener("touchend", function (evt) {
			console.log("touchend="+evt.latLng);
		});
		//모바일상에서 Marker draggable: true일때, 마커 터치 후 움직일때 이벤트 등록
		marker_e.addListener("touchmove", function (evt) {
			console.log("touchmove="+evt.latLng);
			});

	

</script>
</head>
<body onload="initTmap()"><!-- 맵 생성 실행 -->
	<div id="map_wrap" class="map_wrap3">
		<div id="map_div"></div>
		
	</div>
	<div class="map_act_btn_wrap clear_box"></div>
	<p id="result"></p>
</body>
</html>
					
  <!-- 하단 메뉴 -->
  <%@ include file="/WEB-INF/view/include/nav.jsp" %>
  <!-- 하단 메뉴 -->

  <!-- 푸터 -->
  <%@ include file="/WEB-INF/view//include/footer.jsp" %>
  <!-- 푸터 -->