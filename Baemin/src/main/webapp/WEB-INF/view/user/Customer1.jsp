<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe41992d069424d6187555c04c65bce2e"></script>
<title>픽업 / 종료지점 선택</title>
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

<div class = "back" ><div style="margin-top: 8px;" OnClick="location.href ='Customer1'"><strong>Back</strong></div></div>
              
       
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
<script type="text/javascript">
    var drag = "35.14386062986565, 126.9261315427303";
    var drag1= "35.14177767285252,126.93178906362117";
    var map;
   
            // 페이지가 로딩이 된 후 호출하는 함수입니다.
            $(document).ready(function(){
                // map 생성
                // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
                map = new Tmapv2.Map("map_div", { // "map_div" : 지도가 표시될 div의 id
                 
                    center: new Tmapv2.LatLng(35.14386062986565, 126.9261315427303), // 지도 초기 좌표
                    width: "100%", // map의 width 설정
                    height: "100%", // map의 height 설정
                    
                    zoom : 16
                });
                //경유지 마커 .
                var marker = new Tmapv2.Marker({
                    position: new Tmapv2.LatLng(35.14386062986565, 126.9261315427303), //Marker의 중심좌표 설정.
                    draggable: true,
                    icon : "https://cdn2.iconfinder.com/data/icons/toolbar-signs-2/512/map_marker_base-128.png",
                    iconSize : new Tmapv2.Size(42, 42), //Marker의 드래그 가능 여부.
                    map: map,//Marker가 표시될 Map 설정.
				    title : "픽업지점" 
    
                });
                // 도착 마커 
	        	marker_e = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(35.14177767285252,126.93178906362117),
                    draggable: true,
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(36, 48),
					map : map,
					title : "도착지점"
				});
               
                marker.addListener("dragend", function (evt) {
            drag = evt.latLng.toString();
              console.log("경유지 좌표 = " + drag);
                    return drag;
            });
            marker_e.addListener("dragend", function (evt) {
            drag1 = evt.latLng.toString();
              console.log("도착 좌표 = " + drag1);
                    return drag1;
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
		position: new Tmapv2.LatLng(35.13871864586712, 126.9274562217457), //Marker의 중심좌표 설정.
		map: map, //Marker가 표시될 Map 설정..
		title: '미니스톱 조선대 병원본관점',
         icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/supermarket-128.png",
        iconSize : new Tmapv2.Size(42, 42) 
	});

	
    var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14619487207343, 126.93122617411066), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '맘스터치(조선대점)',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });    
    var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14577174000281, 126.9307683482674), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '명랑핫도그 조선대점',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });    
    var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.13930071089182, 126.92564501704322), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '어등진국밥조대병원점',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });           
                 
   
            
            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14440645761805, 126.92955324305255), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '무진장떡볶이    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });             

            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14718841105349, 126.93209017703713), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '커피현상소    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            }); 

            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14690165047988, 126.93161613529563), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '김밥나라    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            }); 
            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14214601116509, 126.92484137213158), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '감성커피조선대점    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.141524045311655, 126.92451925460729), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '안녕커피    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.145153669669526, 126.926786754825), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '도원약국    ',
                icon : "https://cdn4.iconfinder.com/data/icons/medical-soft-1/512/travel_flag_pin_globe_gps_pointer_map_marker-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.146767039701, 126.92820355616242), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '동명약국    ',
                icon : "https://cdn4.iconfinder.com/data/icons/medical-soft-1/512/travel_flag_pin_globe_gps_pointer_map_marker-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });

            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.146747884564455, 126.92780726302207), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '세란약국    ',
                icon : "https://cdn4.iconfinder.com/data/icons/medical-soft-1/512/travel_flag_pin_globe_gps_pointer_map_marker-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14256018310718, 126.92069082314153), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '뉴욕약국    ',
                icon : "https://cdn4.iconfinder.com/data/icons/medical-soft-1/512/travel_flag_pin_globe_gps_pointer_map_marker-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.143667088394615, 126.92197726076874), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '로우딥빙스틸    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14338992773184, 126.92266443952809), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '카모    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
           
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng( 35.14438466437155, 126.92355127161595), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '빙점    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
           
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(  35.14506315709657, 126.9225193133873), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '입춘카페    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
           
            
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14476049012876, 126.92178438814507), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '제임스본죽    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/cafe-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
           
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(  35.14917931171155, 126.92883168055184), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: ' Gelande coffee room    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });

            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(   35.148202057653165, 126.92464297691747), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: ' 프라임픽(PRPK)    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
           
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.14765152088224, 126.92217145925792), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: '서석약국   ',
                icon : "https://cdn4.iconfinder.com/data/icons/medical-soft-1/512/travel_flag_pin_globe_gps_pointer_map_marker-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });
            
           
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(    35.14758948877272, 126.9266095223604), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: ' 힐링카페아만토    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
            });

             
            var marker1 = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(  35.145192042078, 126.92542798497529), //Marker의 중심좌표 설정.
                map: map, //Marker가 표시될 Map 설정..
                title: ' JEEP    ',
                icon : "https://cdn3.iconfinder.com/data/icons/map-markers-1/512/coffee_shop-128.png",
                iconSize : new Tmapv2.Size(42, 42)
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
            <div class = "back" ><div style="margin-top: 8px;" OnClick="location.href ='Mypage'"><strong>Back</strong></div>  </div>
        <div style="position: absolute;
        background-color: rgb(255, 255, 255);
        z-index:10;
        width: 90%;
       left: 100px;
      height: 85px;
      top: 10px;
      display: flex;
      border-radius: 30px;
      text-align:center;
        display:table-cell;
        vertical-align:middle;
        "
        >
       
      <div style="margin-bottom: 2px;"><h1 style="margin-bottom: 5px;"><strong>픽업 / 배달 장소 선택</strong></h1></div>
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
         
 a:link { color: rgb(0, 0, 0); text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: rgb(0, 0, 0); text-decoration: none;}


     </style>
       
     <div class = "deli">
        <div style="margin-top: 18px;" ><a href="javascript:void(0);" onclick="a()"><h1><strong>픽업지 / 배달지 선택완료</strong></h1></a></div>
        

        
       <script>
           function a(){
          
                location.href='Customer4?drag='+drag+'drag1='+drag1
           }
       </script>

        

     
    </div>
    
     </div> 
    
    </div>
    
   
    

 
    
 
   
</body>



</html>
