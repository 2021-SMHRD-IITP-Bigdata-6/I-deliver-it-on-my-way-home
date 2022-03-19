<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>배달자 배달 하기</title>
<%    
    request.setCharacterEncoding("UTF-8");
    String drag = request.getParameter("drag");
	 String drag1 = request.getParameter("drag1");
%>
<style>
	.main_box {
		width: 90%;
		height: 70px;
	}
	.common {
		display: inline-block;
		background-color: white;
		font-size: 25px;
		width: 1200px;
		height:50px;
	}
	.menu{
		text-align: center;
		display:table-cell; text-align:center; vertical-align:middle;
	}
	</style>
	  
	  <div class="main_box">
	  <div class="menu common">우선 추천</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>
<script type="text/javascript">
	var map;
	var marker_s, marker_e, marker_p1, marker_p2;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];





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
	function initTmap() {
		// 1. 지도 띄우기
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(35.14205592237349, 126.93097639694186),
			width : "110%",
			height : "750px",
			zoom : 16,
			zoomControl : true,
			scrollwheel : true
		});
		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker(
				{ // 
					position : new Tmapv2.LatLng(strArray[0],strArray1[0]),
					icon : "/img/human12.png",
					iconSize : new Tmapv2.Size(42, 42),
					map : map,
					title : "배달자"

				});
		// 도착
		marker_e = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(strArray1[1],strArray[2]),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(42, 42),
					map : map,
					title : "도착지점"
				});
		// 경유지 [ 가게 좌표 적기]
		marker = new Tmapv2.Marker({
            
              position : new Tmapv2.LatLng(strArray1[0],strArray[0]),
              icon : "https://cdn2.iconfinder.com/data/icons/toolbar-signs-2/512/map_marker_base-128.png",
              iconSize : new Tmapv2.Size(42, 42),
              map:map,
				  title : "픽업지점"
            
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
						"endX" : "126.92676796851033",
						"endY" : "35.140795058034456",
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지",
						"passList" :xy 		 // 경유지
						/* "viaPoints": [
                         {

                            "viaPointId": "test01",
                            "viaPointName": "test01",
                            
                            "viaX": strArray[1],
                            "viaY": strArray[0],
                         }
                      ] */
					},
					success : function(response) {
						var resultData = response.features;
						//결과 출력
						var tDistance = "총 거리 : "+ ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km,";
						var tTime = " 총 시간 : "+ ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";
										console.log(tDistance)
										console.log(tTime)
										
						 $("#result").text(tDistance + tTime);
						
						//기존 그려진 라인 & 마커가 있다면 초기화
						if (resultdrawArr.length > 0) {
							for ( var i in resultdrawArr) {
								resultdrawArr[i]
										.setMap(null);
							}
							resultdrawArr = [];
						}
						// list 내위치 deli 내위치 동일하게
						// 도착지 경유지 보이기
						// 추천 경로 만들기 (css / 좌표 변수 값)
						
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
	<div class="div_con">
        <div id="map_div"  class="div_box" >
			<div style="position: absolute;
			background-color: aliceblue;
			opacity: 0.8;
			z-index:10;
			width: 30%;
			height: 30px;
			text-align:center;
			display:table-cell; text-align:left; vertical-align:middle;
			
			border-radius: 30px;">
		   
		   <div style="margin-top: 2px;" >추천동선1</div>
		   
		</div>
			
     
       
     <div style="position: absolute;
     background-color: rgb(15, 208, 140);
       z-index:1;
      width: 90%;
      left:5%;
      height: 85px;
      bottom: 5px;

    
     
      display: flex;
      border-radius: 30px;
      text-align:center;
        display:table-cell;
        vertical-align:middle;">
        <div style="margin-top: 27px;"><a href="javascript:void(0);" onclick="a()"><h1>배달 하기</h1></a></div>
        

        
       <script>
           function a(){
              
                location.href='delivery?drag='+drag
           }
       </script>

        

     
    </div>
    
     </div> 
    
    </div>
    
   
    

 
    
 
   </body>
</body>
</html>