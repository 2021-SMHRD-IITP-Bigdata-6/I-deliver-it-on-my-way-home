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

    height:400px;

}


 </style>
   <div class="wrap"> 
 
       <section class="title">
           <h1>my 배달</h1> 
       </section>
         
       <!-- 콘텐츠 -->
       <main>
   
          <div class="container">
          
                <div class="login_box">
                   <c:if test="${user == null}">
                            <a href="/login"><span>로그인을 해주세요</span></a>
               
                       </c:if>
                       
                       
                       <c:if test="${user != null}">
                     <label for="">${mem_name}님! 환영합니다</label>
                     <button type="button" class="logout">로그아웃</button>
                       </c:if>
                </div>

                <div>
                   <a href="/Customer1">
                             <span class="img_box">
                                <img src="/img/icon11.png" alt="주문하기">
                             </span>
                             <span>주문하기</span>
                        </a>
                </div>
            
                

                <div>
                   <a href="/deliverylist">
                             <span class="img_box">
                            <img src="/img/icon22.png" alt="배달하기">
                           </span>
                           <span>배달하기</span>
                       </a>
                </div>
     
             
          </div>
      
       </main>
       
    </div>
    
    <!-- 콘텐츠 -->
 

 
    <!-- 푸터 -->
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    <!-- 푸터 -->
 
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