<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<title>보행자경로</title>
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
	a:link { color: rgb(0, 0, 0); text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: rgb(0, 0, 0); text-decoration: none;}
</style>
<%    
    request.setCharacterEncoding("UTF-8");
    String drag = request.getParameter("drag");
	 String drag1 = request.getParameter("drag1");
%>

</head>
<body onload="initTmap();">
	<style>
		.man {
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
		.man:hover {
		  background: silver;
		 
		  cursor: pointer;
		}
		.man1 {
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
		.man1:hover {
		  background: silver;
		 
		  cursor: pointer;
		}
		.man2 {
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
				margin-top: 100px;
			
				
		}
		.man2:hover {
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
		<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
		<div id="map_wrap" class="div_con">
			<div id="map_div" class="div_box"> 
				
				<div class = "back" ><div style="margin-top: 8px;" OnClick="location.href ='Customer1'"><strong>Back</strong></div></div>
								<div class = "man" ><div style="margin-top: 9px;margin-left: 20px;" id="man1" ></div><strong></strong></div> 
								<div class = "man1" ><div style="margin-top: 9px;margin-left: 20px;" id="man2" ><strong></strong></div></div> 
								<div class = "man2" ><div style="margin-top: 9px;margin-left: 20px;" id="man3" ><strong></strong> </div></div> 
								
								<div class="deli"><div style="margin-top: 20px;"><a href = "javascript:void(0);" onclick="popup();"><h1>주문하기</h1></a></div></div>
							<div class="map_act_btn_wrap clear_box"></div>
							<p id="result"></p>
			
			
		
		
 
 

		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script
			src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe41992d069424d6187555c04c65bce2e"></script>
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
		
			
		
			var strArray=drag.split(',');
			var strArray1=strArray[1].split('drag1=');
		
			var x = strArray1[0];
			var y = strArray[0];
			var xy= strArray1[0]+","+strArray[0];
	
			var x2 = strArray[2];
			var y2 =strArray1[1];
			var xy2= strArray1[1]+","+strArray[2];
		
			var delivery1 = "35.140795058034456, 126.92676796851033";
			var del_1 = {
				x : 126.92676796851033,
				y : 35.140795058034456
			}
			var delivery1y = "35.140795058034456";
			var delivery1x = "126.92676796851033";
			var delivery2 = "35.14020505535849, 126.9259835634641";
			var delivery2y = "35.14020505535849";
			var delivery2x = "126.9259835634641";
			var delivery3 = "35.14215814632468, 126.92632162876542";
			var delivery3y = "35.14215814632468";
			var delivery3x = "126.92632162876542";

			function setStart(delivery1y, delivery1x){
				marker_s = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(delivery1y, delivery1x),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
							iconSize : new Tmapv2.Size(36, 48),
							map : map,
							title : "배달자"
	
						});
				return marker_s;
			}

			
			//기본지도
			function initTmap() {

				// 0.1 Start좌표 구하기
				// JSON Array
				

				//배달자 x/y위치 입니다.
				var starts = [
									{x: 126.9259835634641, y : 35.14020505535849},
									{ x: 126.92632162876542, y : 35.14215814632468},
									{x : 126.92900198049601 ,y : 35.13975416036563}
									
									]
				console.log(starts);

				// 0.2 End좌표 구하기
				var ends = [{x : x2, y : y2}]

				
				// 1. 지도 띄우기
				
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(strArray[0],strArray1[0]),
					width : "100%",
					height : "1050px",
					zoom : 17,
					zoomControl : true,
					scrollwheel : true
				});
		
				// 2. 시작, 도착 심볼찍기
				// 시작
				//marker_s = caseT(delivery1x,delivery1y)
				for(let i = 0 ; i < starts.length; i++){
					marker_s = setStart(starts[i].y, starts[i].x);		
				}

				
						
				// 도착
				marker_e = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(strArray1[1],strArray[2]),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
							iconSize : new Tmapv2.Size(36, 48),
							map : map,
							title : "도착지점"
						});
				// 경유지 [ 가게 좌표 적기]
				marker = new Tmapv2.Marker({
						  position : new Tmapv2.LatLng(strArray[0],strArray1[0]),
						  icon : "https://cdn2.iconfinder.com/data/icons/toolbar-signs-2/512/map_marker_base-128.png",
						  iconSize : new Tmapv2.Size(42, 42),
						  map:map,
						  title : "픽업지점"
				  });
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.14179521941235, 126.92920341420356), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '공차 조선대점',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.14120740675808, 126.92427887863883), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: 'GS25 조선공대점',
					icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/supermarket-128.png",
				  iconSize : new Tmapv2.Size(42, 42) 
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.14163730003545, 126.93203582686924), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선대학교',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/education-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.14054940250649, 126.92957892350469), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선대학교 의과 대학1관',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/education-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.139935260384, 126.9340743056433), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: 'it융합대학',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/education-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.13920996727157, 126.92979510793026), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선이공대 학교 기계설계과',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/education-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.143938784235395, 126.93445142259145), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '광주은행 ATM 조대지점',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/financial-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.14047335157769, 126.92752059475961), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선대학교 신협',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/financial-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.13871864586712, 126.9274562217457), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '미니스톱 조선대 병원본관점',
					icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/supermarket-128.png",
				  iconSize : new Tmapv2.Size(42, 42) 
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.13790269482861, 126.9288938857232), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선간호대학교',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/education-128.png",
				  iconSize : new Tmapv2.Size(42, 42)
			});
			var marker1 = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(35.140719007358804, 126.92502077605246), //Marker의 중심좌표 설정.
				map: map, //Marker가 표시될 Map 설정..
				title: '조선학숙',
				  icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/residence-128.png",
				  iconSize : new Tmapv2.Size(42,42)
			});
		
		
		
				var headers = {}; 
				headers["appKey"]="l7xxe41992d069424d6187555c04c65bce2e";
				
				// 3. 경로탐색 API 사용요청
				var tDistance;
				var tTime;
				for(let i =0;i < starts.length; i++){
					colorList = ["#FF0000", "#0000FF", "#FFFF00","#00000"];
					
					setTimeout(()=> del1({
						'headers' : headers,
						'startX' : starts[i].x,
						'startY' : starts[i].y,
						'endX' : ends[0].x,
						'endY' : ends[0].y,
						'idx' : i+1,
						'color' : colorList[i]	
					}), (i+1)*2000)	
				}
							
						
			}
			function addComma(num) {
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			
			function drawLine(arrPoint, color) {
				var polyline_;
				polyline_ = new Tmapv2.Polyline({
					path : arrPoint,
					strokeColor : color,
					strokeWeight : 6 ,
					map : map
				
				});
		
			}			
		
			function del1(dataObject) {
					$.ajax({
							method : "POST",
							headers : dataObject.headers,
							url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
							async : false,
							data : {
								"appKey" : "l7xxe41992d069424d6187555c04c65bce2e",
								"startX" : dataObject.startX,
								"startY" : dataObject.startY,
								"endX" : dataObject.endX,
								"endY" : dataObject.endY,
								"reqCoordType" : "WGS84GEO",
								"resCoordType" : "EPSG3857",
								"startName" : "출발지",
								"endName" : "도착지",
								"passList" :xy //경유지 좌표
							},
							success : function(response) {
								var resultData = response.features;
								//결과 출력
								tDistance = "배달자"+ dataObject.idx +"의 거리 : "+ ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km ";
							   tTime = " 시간 : "+ ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";
								document.getElementById("man" + dataObject.idx).innerHTML="<strong>"+tDistance + tTime+"</strong>";
							
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
								drawLine(drawInfoArr,dataObject.color);
							},
							error : function(request, status, error) {
								console.log("code:" + request.status + "\n"
										+ "message:" + request.responseText + "\n"
										+ "error:" + error);
							}
						});
					}
			
						
			
			





			 
			
			
		
		</script>
		
<script>
	
        function popup(){
            var url = "memo";
            var name = "memo test";
            var option = "width = 550, height =825, top = 100, left = 600, location = no"
            window.open(url, name, option);
        }
    </script>

		
</body>
</html>