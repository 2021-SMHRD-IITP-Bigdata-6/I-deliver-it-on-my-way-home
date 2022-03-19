<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>

<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<script type="text/javascript">
    var drag;
 //   var drag1;
    var map;
   
            // 페이지가 로딩이 된 후 호출하는 함수입니다.
            $(document).ready(function(){
                // map 생성
                // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
                map = new Tmapv2.Map("map_div", { // "map_div" : 지도가 표시될 div의 id
                 
                    center: new Tmapv2.LatLng(35.14205592237349, 126.93097639694186), // 지도 초기 좌표
                    width: "110%", // map의 width 설정
                    height: "750px", // map의 height 설정
                    
                    zoom : 16
                });
                //경유지 마커 .
                var marker = new Tmapv2.Marker({
                    position: new Tmapv2.LatLng(35.14153028103175,126.92892073710861), //Marker의 중심좌표 설정.
                    draggable: true,
                    icon : "/img/human12.png",
                    iconSize : new Tmapv2.Size(42, 42), //Marker의 드래그 가능 여부.
                    map: map,//Marker가 표시될 Map 설정.
				    title : "배달자 위치" 
                
    
                });
                // // 도착 마커 
	        	// marker_e = new Tmapv2.Marker({
				// 	position : new Tmapv2.LatLng(35.14161098010376, 126.93206801335873),
                //     draggable: true,
				// 	icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
				// 	iconSize : new Tmapv2.Size(24, 38),
				// 	map : map,
				// 	title : "도착지점"
				// });
               
                marker.addListener("dragend", function (evt) {
            drag = evt.latLng.toString();
              console.log("배달자 위치 = " + drag);
                    return drag;
            });
            // marker_e.addListener("dragend", function (evt) {
            // drag1 = evt.latLng.toString();
            //   console.log("도착 좌표 = " + drag1);
            //         return drag1;
            // });

        })
           
        </script>
        
 
 <style>
    .div_con{
        position: relative;
        width: 100% ;
        height: 969px;   
      
    }
     .div_box{
         position: relative;
         width: 90%;
         height: 90%;
     
     }
 </style>


<body>
   
    <div class="div_con">
        <div id="map_div"  class="div_box" >
        <div style="position: absolute;
        background-color: aliceblue;
        z-index:10;
        width: 100%;
        height: 30px;
        text-align:center;
        display:table-cell; text-align:center; vertical-align:middle;
        
        border-radius: 30px;">
       
      <div style="margin-top: 2px;">위치 </div>
        </div> 
        
     
       
     <div style="position: absolute;
     background-color: rgb(15, 208, 140);
       z-index:1;
      width: 90%;
      left:5%;
      height: 80px;
      bottom: 5px;

    
     
      display: flex;
      border-radius: 30px;
      text-align:center;
        display:table-cell;
        vertical-align:middle;">
        <div style="margin-top: 27px;"><a href="javascript:void(0);" onclick="a()"><h1>배달 ON</h1></a></div>
        

        
       <script>
           function a(){
              
            location.href='delivery?drag='+drag
           }
       </script>

        

     
    </div>
    
     </div> 
    
    </div>
    
   
    

 
    
 
   
</body>



</html>
