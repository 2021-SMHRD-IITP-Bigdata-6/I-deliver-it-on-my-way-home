<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxf0b20425767d4229b30712708501d2c7"></script>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<script type="text/javascript">
    var drag = "35.14153028103175,126.92892073710861";
     var drag1 ="35.1423198760242,126.93190335353316";
    var map;
   
            // 페이지가 로딩이 된 후 호출하는 함수입니다.
            $(document).ready(function(){
                // map 생성
                // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
                map = new Tmapv2.Map("map_div", { // "map_div" : 지도가 표시될 div의 id
                                         
                    center: new Tmapv2.LatLng(35.14153028103175,126.92892073710861), // 지도 초기 좌표
                    width: "100%", // map의 width 설정
                    height: "100%", // map의 height 설정
                    
                    zoom : 16
                });
                //내 위치.
                var marker = new Tmapv2.Marker({            // 내 위치 (다댐맨 DB값)
                    position: new Tmapv2.LatLng(35.14153028103175,126.92892073710861), //Marker의 중심좌표 설정.
                    draggable: true,
                    icon : "/img/human12.png",
                    iconSize : new Tmapv2.Size(42, 42), //Marker의 드래그 가능 여부.
                    map: map,//Marker가 표시될 Map 설정.
				    title : "내 위치" 
    
                });
              //  도착 마커 
	        	// marker_e = new Tmapv2.Marker({
				// 	position : new Tmapv2.LatLng(35.1423198760242,126.93190335353316),
                //     draggable: true,
				// 	icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
				// 	iconSize : new Tmapv2.Size(32, 42),
				// 	map : map,
				// 	title : "도착지"
				// });
               
                marker.addListener("dragend", function (evt) {
            drag = evt.latLng.toString();
              console.log("내 위치 = " + drag);
                    return drag;
            });
            // marker_e.addListener("dragend", function (evt) {
            // drag1 = evt.latLng.toString();
            //   console.log("도착 좌표 = " + drag1);
            //         return drag1;
            // });

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

            })
           
        </script>
        
 
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

      <div style="margin-top: 14px;"><h1>내 위치</h1></div>
      <div style="margin-top: 14px;"><h2>지도를 움직여 아이콘을 원하는 위치로 옮기세요</h2></div>
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
              
            location.href='delivery?drag='+drag+'drag1='+drag1
           }
       </script>

        

     
    </div>
    
     </div> 
    
    </div>
    
   
    

 
    
 
   
</body>



</html>
