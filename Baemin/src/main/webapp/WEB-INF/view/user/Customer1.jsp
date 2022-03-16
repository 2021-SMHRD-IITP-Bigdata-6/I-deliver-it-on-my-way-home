<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe41992d069424d6187555c04c65bce2e"></script>

<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<script type="text/javascript">
    var drag;
    var map;
            // 페이지가 로딩이 된 후 호출하는 함수입니다.
            $(document).ready(function(){
                // map 생성
                // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
                map = new Tmapv2.Map("map_div", { // "map_div" : 지도가 표시될 div의 id
                 
                    center: new Tmapv2.LatLng(35.14153028103175,126.92892073710861), // 지도 초기 좌표
                    width: "95%", // map의 width 설정
                    height: "95%", // map의 height 설정
                    
                    zoom : 16
                });
                //Marker 객체 생성.
                var marker = new Tmapv2.Marker({
                    position: new Tmapv2.LatLng(35.14153028103175,126.92892073710861), //Marker의 중심좌표 설정.
                    draggable: true,
                    icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/market-128.png",
                    iconSize : new Tmapv2.Size(50, 64), //Marker의 드래그 가능 여부.
                    map: map //Marker가 표시될 Map 설정.
    
                });
                marker.addListener("dragend", function (evt) {
            
           
            var drag = evt.latLng.toString();
    
              console.log(drag);
             
                    return drag;
    
    
    
    
            });
      
            }	)
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
        < id="map_div"  class="div_box" >
        <div style="position: absolute;
        background-color: aliceblue;
        z-index:10;
        width: 100%;
        height: 30px;
        text-align:center;
        display:table-cell; text-align:center; vertical-align:middle;
        
        border-radius: 30px;">
       
      <div style="margin-top: 2px;">픽업 장소 선택</div>
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
        <div style="margin-top: 27px;"><a href="Testpage?drag='drag'" ><h1>픽업지 선택</h1></a></div>
        

        
       

        

     
    </div>
    
     </div> 
    
    </div>
    
   
    

 
    
 
   
</body>



</html>
