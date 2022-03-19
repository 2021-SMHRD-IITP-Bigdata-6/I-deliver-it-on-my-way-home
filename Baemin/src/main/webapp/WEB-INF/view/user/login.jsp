<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<head>        
 <script script type="text/javascript">

$(function(){
$("#btnLogin").click(function(){
 mem_id=$("#mem_id").val();
 var mem_pw=$("#mem_pw").val(); if(mem_id == ""){
  alert("아이디를 입력하세요");
  $("#mem_id").focus(); //입력포커스 이동

  return; //함수 종료
}
if(mem_pw==""){
 alert("비밀번호를 입력하세요"); 
 $("#mem_pw").focus();
  return;
}
//폼 내부의 데이터를 전송할 주소


 });
});
 </script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
    <main>
        <div class="login_box">
         <a href="/"><img src="/img/로긴페이지1-001.png" alt="이미지" class="bm_img"></a>    
            
            <form action="/login_check" method="post">
 
               <div class="input_aera"><input type="text" name="mem_id"  value="" required placeholder="아이디를 입력해 주세요" maxlength="30" ></div>
               <div class="input_aera"><input type="password" name="mem_pw"  value="" required placeholder="비밀번호를 입력해 주세요" maxlength="30"></div>
 
         
               <button type="submit" id="btnLogin">로그인 </button>
               <c:if test="${message == 'error'}">
               <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
               </div>
               </c:if>
               <c:if test="${message == 'logout'}">
               <div style="color:red;"> 로그아웃되었습니다.
               </div>
               </c:if>
               
          
                  <div>
                     <span class="id_search"><a href="/find/id">아이디</a></span>
                     <span> ㅣ </span>
                     <span><a href="/find/password">비밀번호 찾기</a></span>
                  </div>
               </div>
            </form>
            
         <div id="oauth_login">
           
         </div>
         <div class="join"><a href="/join2" >회원 가입하러 가기</a></div>
        </div>
    </main>
    
    
</body>
</html>