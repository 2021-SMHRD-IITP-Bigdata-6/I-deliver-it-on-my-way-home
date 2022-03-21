<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>

<section class="category_box">
    <div class="box">
<ul class="category">
                    
    <li>

        <div id="box1">
            <div class="img_box">
               <a href="deliverylist"><img src="/img/weig.png" alt="이미지"></a>
            </div>
            <div class="name">대기</div>
        </div>
    </li>

    <li>
        <div id="box2">
            <div class="img_box">
               <a href="delivery"><img src="/img/prog.png" alt="이미지"></a>
            </div>
            <div class="name">진행</div>
        </div>
    </li>
  
    <li>
        <div id="box3">
            <div class="img_box">
               <a href="deliveryfinish"><img src="/img/comp.png" alt="이미지"></a>
            </div>
            <div class="name">완료</div>
        </div>
    </li>
    </div>
    </ul>
    
</section>
  <!-- 푸터 -->
  <%@ include file="/WEB-INF/view//include/footer.jsp" %>
  <!-- 푸터 -->