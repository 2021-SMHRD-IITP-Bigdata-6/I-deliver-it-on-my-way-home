<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<%    
    request.setCharacterEncoding("UTF-8");
    String drag = request.getParameter("drag");
	 String drag1 = request.getParameter("drag1");
%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>
<script type="text/javascript">
	var tDistance;
			var tTime;
			var map;
			var marker_s, marker_e, marker_p1, marker_p2;
			var totalMarkerArr = [];
			var drawInfoArr = [];
			var resultdrawArr = [];
			var delivery1y;
			var delivery1x;


	var drag = "<%=drag%>";
	console.log("drag = " + drag);


   var strArray=drag.split(',');
   var strArray1=strArray[1].split('drag1=');

   console.log('drag y =' + strArray[0]);
   console.log('drag x = ' + strArray1[0]);
	var x = strArray1[0];
	var y = strArray[0];
	var xy= strArray1[0]+","+strArray[0];
	console.log(xy);

  
    console.log('drag1 y = ' + strArray1[1]);
	console.log('drag2 x = ' + strArray[2])
	var x2 = strArray[2];
	var y2 =strArray1[1];
	var xy2= strArray1[1]+","+strArray[2];
	console.log(xy2);

	var delivery1 = "35.14153028103175, 126.92892073710861";
			var del_1 = {
				x : 126.92892073710861,
				y : 35.14153028103175
			}
			var delivery1y = "35.14153028103175";
			var delivery1x = "126.92892073710861";

	function initTmap() {
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(35.14153028103175,126.92892073710861),
			width : "100%",
			height : "850px",
			zoom : 16,
			zoomControl : true,
			scrollwheel : true
		});
		// 2. 시작, 도착 심볼찍기
		// 내 위치
		marker_s = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(strArray1[0],strArray[0]),
					icon : "/img/human12.png",
					iconSize : new Tmapv2.Size(42, 42),
					map : map,
					title : "내 위치"

				});
		// 도착지
		marker_e = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(strArray1[1],strArray[2]),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(32, 42),
					map : map,
					title : "도착지"
				});
		// 경유지
		marker = new Tmapv2.Marker({
			
              position : new Tmapv2.LatLng(35.14495180401309,126.93443535884322),
              icon : "https://cdn2.iconfinder.com/data/icons/toolbar-signs-2/512/map_marker_base-128.png",
              iconSize : new Tmapv2.Size(38, 42),
              map:map,
				  title : "경유지"
            
        });

		  var headers = {}; 
        headers["appKey"]="l7xxf0b20425767d4229b30712708501d2c7";

		// 3. 경로탐색 API 사용요청
		$.ajax({
					method : "POST",
					headers : headers,
					url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
					async : false,
					data : {
						"appKey" : "l7xxf0b20425767d4229b30712708501d2c7",
						"startX" : x,
						"startY" : y,
						"endX" : x2,
						"endY" : y2,
						"viaX" : "126.93443535884322",
						"viaY" : "35.14495180401309",
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지",
						"passList" :xy, //경유지 좌표
						"viaPoints": [
				    {
				      "viaPointId": "marker",
				      "viaPointName": "marker",
				      "viaX": "126.93443535884322",
				      "viaY": "35.14495180401309",
					},
						]
					},
					success : function(response) {
						var resultData = response.features;
						//결과 출력
						var tDistance = "배달 경로: "+ ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km ";
						var tTime = " 시간 : "+ ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";
						
										console.log(tDistance)
										console.log(tTime)
										
						$("#one").append(tDistance + tTime);


						

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
</script>
</head>
<body onload="initTmap();">
	
	<style>
		.one {
			position: absolute;
				background-color: aliceblue;
				z-index:10;
				width: 300px;
				left:5%;
				height: 40px;
				text-align:left;
				display:table-cell; 
				
				vertical-align:left;
				border-radius: 30px;
				margin-top: 10px;
			
				
		}
		.one:hover {
		  background: silver;
		 
		  cursor: pointer;
		}
		.two {
			position: absolute;
				background-color: aliceblue;
				z-index:10;
				width: 300px;
				left:5%;
				height: 40px;
				text-align:left;
				display:table-cell; 
				
				vertical-align:left;
				border-radius: 30px;
				margin-top: 55px;
			
				
		}
		.two:hover {
		  background: silver;
		 
		  cursor: pointer;
		}
		.back{position: absolute;
				background-color: aliceblue;
				z-index:10;
				width: 60px;
				height: 40px;
				text-align:center;
				display:table-cell; 
				
				vertical-align:left;
				border-radius: 30px;
				margin-top: 10px;
				margin-left: 5px;}
		.back:hover{
			background: silver;
		 
		  cursor: pointer;
		}

	 </style>
	 <script>
		 function one(){
			 
		 }
	 </script>>
		<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
		<div id="map_wrap" class="div_con">
			
			<div id="map_div" class="div_box">
				<div class = "back" ><div style="margin-top: 8px;" OnClick="location.href ='deliverylist'"><strong>Back</strong></div>  </div>
				<div class = "one" >
			 <div style="margin-top: 9px;margin-left: 20px;" id="one"></div>
				</div> 
				
			</div>
			<style>
				.deli{
					position: absolute;
		  background-color: rgb(255, 255, 255);
			 z-index:1;
			width: 30%;
			left:600px;
			height: 85px;
			bottom: 10px;
			display: flex;
			border-radius: 30px;
			text-align:center;
			  display:table-cell;
			  vertical-align:middle;
			  
				}
				.deli:hover{
					background: silver;
			 
				cursor: pointer;
				}
		  </style>
			<div class="deli">
        <div style="margin-top: 20px;"><a><h1>배달하기</h1></a></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		<p id="result"></p>
	<div class="map_act_btn_wrap clear_box"></div>
	<p id="result"></p>
</body>
</html>