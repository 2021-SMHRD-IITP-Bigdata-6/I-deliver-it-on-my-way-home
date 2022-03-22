<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/Mypage.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>
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
  content: "";
  display: block;
  clear: both;
}


.content1 {
  /* 'width: OO%'꼴을 블록 요소에 지정하면 부모 요소(content1_wrap)의 너비에 맞춰 늘어난다. */
  width: 300px;
  height: 200px;
  margin: 1%;
}


.content1_wrap {
  width: 1000px;
  /* 가운데 정렬을 하기 위한 요소 */
  margin-left: 5%;
  margin-right: 100px;
}
.login_box{
    width: 150px;height: 150px;
     line-height: 150px; /* 세로 가운데 정렬 : line-height와 height값을 동일하게 처리합니다.*/ 
     text-align: center; /* 텍스트 가운데 정렬 */
     margin-left: 520px;

}
.join_box{
    width: 150px;height: 50px;
     line-height: 100%; /* 세로 가운데 정렬 : line-height와 height값을 동일하게 처리합니다.*/ 
     text-align: center; /* 텍스트 가운데 정렬 */
     margin-left: 520px;

}


 </style>
 
   <div class="wrap"> 
 
       <section class="title">
           <h1>My 배달</h1> 
       </section>
         
       <!-- 콘텐츠 -->
       <main>
   
          <div class="container">
          
                <div class="login_box" >
                   <c:if test="${user == null}">
                            <a href="/login"><span><h2>로그인을 해주세요</h2></span></a>
               
                       </c:if>
                    </div>
                       
                <div class="join_box">
                    <c:if test="${user != null}">
                        <label for="">${mem_name}님! 환영합니다</label>
                        <button type="button" class="logout">로그아웃</button>
                    </div>
                    </c:if>
                <div class="content1_wrap s-horizon_wrap">
                <div class="content1 s-horizon">
                        <a href="/Customer1">
                              <span class="img_box">
                                  <img src="/img/ordericon1.png" alt="주문하기">
                                </span>
                                <figcaption>주문하기</figcaption>
                            </a>                    
                     </div>

                   <div class="content1 s-horizon">
                       <a href="/delivery1">
                           <span class="img_box">
                               <img src="/img/deliveryicon.png" alt="배달하기">
                            </span>
                            <figcaption>배달하기</figcaption>
                        </a>
                    </div>
                </div>
                </div>
             
          </div>
      
       </main>
       
    </div>
    
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