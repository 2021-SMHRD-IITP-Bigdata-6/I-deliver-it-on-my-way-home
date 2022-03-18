<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe41992d069424d6187555c04c65bce2e"></script>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<%    
    request.setCharacterEncoding("UTF-8");
    String drag = request.getParameter("drag");
%>

 <style>
    
    .div_con{
        position: relative;
        width: 100%;
        height: 969px;
    }
     .div_box{
         position: relative;
         width: 100%;
         height: 969px;
       
     }
 </style>

 
<body>
    
    <div class="div_con">
        <div style="position: absolute;
        background-color: aliceblue;
          z-index:10;
         width: 100%;
         height: 30px;"
         
         >
        
            <h2 align = center style="padding-top: 5px;">우선추천

               </h2>
     
        
        </div> 
        
     <div id="map_div" class="div_box"></div>
        
    
    
    
   
    </div>
    

 
    
 
   

</body>

<script type="text/javascript">
  //16r개?
   var drag = "<%=drag%>";
   var strArray=drag.split(',');
   console.log(strArray[0]);
   console.log(strArray[1]);
   console.log(drag);
    var map;
    var marker_s, marekr_e;
    
    //경로그림정보
    var drawInfoArr = [];
    
    $(document).ready(function(){



        // 1. 지도 띄우기
        map = new Tmapv2.Map("map_div", {
            
            center: new Tmapv2.LatLng(strArray[0], strArray[1]),
            width : "100%",
            height : "100%",
            zoom : 16,
            zoomControl : true,
            scrollwheel : true
        });
        
        // 시작, 도착 심볼찍기
        //  배달자 시작 위치입니다.
        marker_s = new Tmapv2.Marker({
             
            position : new Tmapv2.LatLng(35.14106109876024, 126.92714737171818),
            icon : "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png" ,
            iconSize : new Tmapv2.Size(50, 64),
            map:map
        });
        
        // 도착 = 배달 종료 위치 입니다.
        marker_e = new Tmapv2.Marker({
            
            position : new Tmapv2.LatLng(35.141761287215914, 126.93182619326623),
            icon : "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png",
            iconSize : new Tmapv2.Size(50, 64),
            map:map
        });
        // 경유지 [ 가게 좌표 적기]
        marker = new Tmapv2.Marker({
            
            position : new Tmapv2.LatLng(strArray[0],strArray[1]),
            icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/market-128.png",
            iconSize : new Tmapv2.Size(42, 42),
            map:map
            
        });
       
        
       
        var headers = {}; 
        headers["appKey"]="l7xxe41992d069424d6187555c04c65bce2e";
        
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
                            
                            "viaX": strArray[1],
                            "viaY": strArray[0],
                         }
                      ]
            }),
            success:function(response){
                var resultData = response.properties;
                var resultFeatures = response.features;
                
                // 결과 출력
                var tDistance = "총 거리 : " + (resultData.totalDistance/1000).toFixed(1) + "km  ";
                var tTime = "총 시간 : " + (resultData.totalTime/60).toFixed(0) + "분  ";
                var tFare = "총 요금 : " + resultData.totalFare + "원";
                console.log(tTime);
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
</html>
