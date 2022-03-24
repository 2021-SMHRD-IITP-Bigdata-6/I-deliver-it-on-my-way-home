<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/Mypage.css">

<script type="text/javascript">
$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

</script>
 <style>
main .container .grid_box {
    margin: 0 auto 30px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 100px 450px;
    width: 67%;
    text-align: center;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}
.img_box{
    
    width: 10px;
    height: 10px;
}
.s-horizon {
  /* div요소를 가로로 배열하기 위한 요소 */
  float:left;
}

/* div요소들을 가로 정렬한 뒤에 밑의 div와 겹치지 않게 처리하는 요소  */
.s-horizon_wrap:after {
  grid-template-columns: 1fr 1fr;
  content: "";
  display: block;
  clear: both;
}


.content1 {
  /* 'width: OO%'꼴을 블록 요소에 지정하면 부모 요소(content1_wrap)의 너비에 맞춰 늘어난다. */
  position: relative;
  padding:6px;
  left:16px;
  top:10px;
  width: 100px;
  height: 100px;
  text-align: center; 
  margin: 1%;
}


.content1_wrap {
  width: 500px;
  /* 가운데 정렬을 하기 위한 요소 */
  margin-left: 5%;
  margin-right: 150px;
}

.login_box{
    
    width: 150px;height: 70px;
     text-align: center; /* 텍스트 가운데 정렬 */
     margin-left: 200px;
     

}
img{
    width:100px;
    height:100px;
}
main{
    width:300px;
    height:300px;
    background-color: #fff;
    position: relative;
    left:30px;
    border-radius: 3%;
}
.slideshow-container {
  max-width: 1440px;
  position: relative;
  margin: auto;
  margin-top: 70px;
}

/* effect */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;	
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
 </style>
<body style="background-color: #ead7c6;">
		<div id="header" style="height:90px;">
			<a href="/"><img src="/img/가는길에배달해조1-001 (1).png" alt="이미지" style="width:150px; height:150px;"> </a>
            <div id="name_box" style="position: relative; left:200px; bottom:130px;">    
                <c:if test="${user == null}">
                     <a href="/login"><span><h2>로그인을 해주세요</h2></span></a>
            
                </c:if>

                <c:if test="${user != null}">
                     <label for="">${mem_name}님! 환영합니다</label>
                     <button type="button" class="logout">로그아웃</button>
                 </c:if>
            </div>
		</div>
   
        <br>
       <!-- 콘텐츠 -->
       <main>
          <div class="container">
          
                
                <div class="content1_wrap s-horizon_wrap">
                <div class="content1 s-horizon">
                        <a href="/Customer1">
                              <span class="img_box">
                                  <img src="/img/order123.png" alt="주문하기">
                                </span>
                                <figcaption>주문하기</figcaption>
                            </a>                    
                     </div>

                   <div class="content1 s-horizon">
                       <a href="/delivery1">
                           <span class="img_box">
                               <img src="/img/deliver123.png" alt="배달하기">
                            </span>
                            <figcaption>배달하기</figcaption>
                        </a>
                    </div>
                    </div>
                    <div class="content1_wrap s-horizon_wrap"> 
                    <div class="content1 s-horizon">
                        <a href="/delivery1">
                            <span class="img_box">
                                <img src="/img/store123.png" alt="추천가게">
                             </span>
                             <figcaption>추천가게</figcaption>
                         </a>
                     </div>
                     <div class="content1 s-horizon">
                        <a href="/review">
                            <span class="img_box">
                                <img src="/img/review124.png" alt="배달이력">
                             </span>
                             <figcaption>리뷰보기</figcaption>
                         </a>
                     </div>
                </div>
                </div>
             
          </div>
      
       </main>
    
       <div class="slideshow-container">

        <div class="mySlideDiv fade active">
           <img src="/img/banner3.png"style="width: 400px;"> 
        </div>
               
        <div class="mySlideDiv fade">
            <img src="/img/banner2.png"style="width: 400px;"> 
        </div>
               
        <div class="mySlideDiv fade">
            <img src="/img/banner1.png"style="width: 400px;"> 
        </div>
   
        <a class="prev" onclick="prevSlide()">&#10094;</a>
        <a class="next" onclick="nextSlide()">&#10095;</a>
               
   </div>
   
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <div class="box">
        <div>(주)가는길에배달해조</div>
        <div>팀>전시완,정채민,문성주,배윤서,최정곤</div>
        <div>Git주소>jcm829700@naver.com</div>
        <div>DCX기반 빅데이터 분석 서비스 개발자과정</div>
     </div>

     <img src="/img/sakura123.png" style="width:100px;height:100px; position: relative; left:256px; top:-95px;">
    
    <!-- 콘텐츠 -->
 

    <script type="text/javascript">
 
        $(".updating").click(function () {
            swal("업데이트 준비 중 입니다");
        })
 
        $(".logout").click(function () {
            location.href = "/login";
        })
        
        

    </script>
   
</body>
 
</html>