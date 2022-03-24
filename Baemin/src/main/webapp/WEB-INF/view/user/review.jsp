<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>

<body style="background-color: #ead7c6;">
    <div id="header" style="height:90px;">
        <a href="/"><img src="/img/가는길에배달해조1-001 (1).png" alt="이미지" style="width:150px; height:150px;"> </a>
    
 
    </div>
    
        <div style="height:50px;width:150px; position: relative; left: 110px; font-size:25px;">과거 배달 이력</div>
        <br>
        <form style="height:510px;width:345px;position: relative;left:5px;">
     
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFCCCC;">
            <div style="height:100%;width:5%;">01</div>
            <div style="height:100%;width:30%;position: relative; left: 20px;top:-50px;">성함 : 문성주</div>
            <div style="height:100%;width:60%;position: relative; left:100px;top:-100px;">주문내용 : 아이스아메리카노 1개</div>
          </div>
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFFFFF;">
            <div style="height:100%;width:10%;">02</div>
            <div style="height:100%;width:30%; position: relative; left: 20px;top:-50px;">성함 : 정채민</div>
            <div style="height:100%;width:60%; position: relative; left:100px;top:-100px;">주문내용 : 허니자몽티 2개</div>
          </div>
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFCCCC;">
            <div style="height:100%;width:10%;">03</div>
            <div style="height:100%;width:30%; position: relative; left: 20px;top:-50px;">성함 : 최정곤</div>
            <div style="height:100%;width:60%; position: relative; left:100px;top:-100px;">주문내용 : 급하게 준비물하나만..,</div>
          </div>
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFFFFF;">
            <div style="height:100%;width:10%;">04</div>
            <div style="height:100%;width:30%; position: relative; left: 20px;top:-50px;">성함 : 전시완</div>
            <div style="height:100%;width:60%; position: relative; left:100px;top:-100px;">주문내용 : 불고기세트1개 도착할때 전화주세요.</div>
          </div>
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFCCCC;">
            <div style="height:100%;width:10%;">05</div>
            <div style="height:100%;width:30%; position: relative; left: 20px;top:-50px;">성함 : 배윤서</div>
            <div style="height:100%;width:60%; position: relative; left:100px;top:-100px;">주문내용 : 햄치즈토스트2개 조심히오세요~</div>
          </div>
          <div style="height:50px;width:100%;border: 3px solid #fff;background-color: #FFFFFF;">
            <div style="height:100%;width:10%;">06</div>
            <div style="height:100%;width:30%; position: relative; left: 20px;top:-50px;">성함 : <%=request.getParameter("name")%></div>
            <div style="height:100%;width:60%; position: relative; left:100px;top:-100px;">주문내용 : <%=request.getParameter("order")%></div>
          </div>
          
          <div style="height:20px;width:30px; background-color: #FFFFFF; position: relative; left: 120px; top:30px; border-radius:10%; margin-left:23px;">
              <a href="login_check">나가기</a>
          </div>
        </form>
         
    <div class="box">
        <div>(주)가는길에배달해조</div>
        <div>팀>전시완,정채민,문성주,배윤서,최정곤</div>
        <div>Git주소>jcm829700@naver.com</div>
        <div>DCX기반 빅데이터 분석 서비스 개발자과정</div>
     </div>

     <img src="/img/sakura123.png" style="width:100px;height:100px; position: relative; left:256px; top:-95px;">

</body>
</html>