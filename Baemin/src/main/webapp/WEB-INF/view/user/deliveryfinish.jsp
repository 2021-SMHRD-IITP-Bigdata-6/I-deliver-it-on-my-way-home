<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
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
			center : new Tmapv2.LatLng(35.14153028103175,126.92892073710861),
			width : "100%",
			height : "850px",
			zoom : 16,
			zoomControl : true,
			scrollwheel : true
		});
		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker(
				{ // 
					position : new Tmapv2.LatLng(strArray[0],strArray1[0]),
//				{ // if(#deli1==(delivery1x,delivery1y)){ position : new Tmapv2.LatLng(delivery1x, delivery1y)else if(#deli2==)  }


				
					position : new Tmapv2.LatLng(strArray[0],strArray1[0]),
					icon : "/img/human12.png",
					iconSize : new Tmapv2.Size(40, 40),
					map : map,
					title : "내 위치"

				});
		// 경유지
		marker_e = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(strArray1[1],strArray[2]),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(36, 48),
					map : map,
					title : "경유지"
				});
		// 도착점
		marker = new Tmapv2.Marker({
            
              position : new Tmapv2.LatLng(35.140795058034456, 126.92676796851033),
              icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
              iconSize : new Tmapv2.Size(36, 48),
              map:map,
				  title : "도착점"
            
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
						"startX" : strArray1[0],
						"startY" : strArray[0],
						"endX" : 126.92676796851033,
						"endY" : 35.140795058034456,
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지",
						"passList" : xy //경유지 좌표
					
					},
					success : function(response) {
						var resultData = response.features;
						//결과 출력
						var tDistance = "추천 경로 : "+ ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km ";
						var tTime = " 시간 : "+ ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";
										console.log(tDistance)
										console.log(tTime)
										
						$("#man").append( "<strong>"+tDistance + tTime+"</strong>");

						

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
<body onload="initTmap();">
	<style>
		.div_con{
			position: relative;
			width: 100% ;
			height: 1080px;   
			
		}
		.div_box{
			position: relative;
         width: 90%;
         height: 90%;
		 
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


<body>
    <div class="div_con">
		<div id="map_div"  class="div_box" >
			<div class = "back" ><div style="margin-top: 8px;" OnClick="location.href ='deliveryhome'">Back</div>  </div>
			<div style="position: absolute;
        background-color: aliceblue;
        background-color: rgb(255, 255, 255, 0.4);
        z-index:10;
        width: 90%;
        left:5%;
        height: 60px;
        text-align:center;
        display:table-cell; 
        text-align:center; 
        vertical-align:middle;
        border-radius: 30px;
        margin-top: 10px;
        "
        >
		
		<div style="margin-top: 14px;"><h1><strong>내 위치</strong></h1></div>
      <div style="margin-top: 14px;"><h2><strong>지도를 움직여 아이콘을 원하는 위치로 옮기세요</strong></h2></div>
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
       
     <div class = "deli">
        <div  style="margin-top: 27px;" ><a href="javascript:void(0);" onclick="a()"><h1>배달 ON</h1></a></div>
        

        
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
