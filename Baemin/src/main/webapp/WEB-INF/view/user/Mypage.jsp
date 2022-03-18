<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/Mypage.css">
 
<%@ include file="/WEB-INF/view/include/header.jsp" %>
 
   <div class="wrap"> 
 
       <section class="title">
           <h1>my 배달</h1> 
       </section>
         
       <!-- 콘텐츠 -->
       <main>
   
          <div class="container">
          
             <div class="grid_box">
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
                  <a href="Customer1">
                     <span class="img_box">
                        <img src="/img/icon44.png" alt="찜한가게">
                     </span>
                     <span>구매자첫페이지</span>
                  </a>
                </div>
                
                
                <div>
                  <a href="Testpage">
                     <span class="img_box">
                        <img src="/img/icon55.png" alt="주문내역">
                     </span>
                     <span>구매자두번째페이지</span>
                  </a>
                </div>
                
                
                
                
             </div>
             
          </div>
      
       </main>
       
    </div>
    
    <!-- 콘텐츠 -->
 
 
    <!-- 하단 메뉴 -->
   <%@ include file="/WEB-INF/view/include/nav.jsp" %>
    <!-- 하단 메뉴 -->
 
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
        
        function loginCheck(){
           const nickname = $(".nickname").data("nickname");
           if(!nickname) {
              swal("로그인 후 이용 가능합니다");
              return false;
           }
           return true;
           
        }
        
    </script>
 
</body>
 
</html>