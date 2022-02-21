<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int a= 10 ; %>
<c:set var="a" value="10" /> <!-- JSTL은 변수가 문자로 된다. -->
자바스크립트 : <%=a %> <br>
EL :${a}
<br>
<c:if test="${a%2==0}">    <!--  True일때만 실행  -->
${a}는(은) 짝수에요~
</c:if>
<br>
<c:if test="${a%2!=0}">
${a}는(은) 홀수에요~!
</c:if>
<br>

<c:choose>
<c:when test="${a%2==0}"> <!-- when  = 케이스 문 / / / When이 참일때만 실행함.   --> 
짝수네용
</c:when>    
<c:when test="${a%2!=0}">홀수네요</c:when>
<c:otherwise>^^</c:otherwise>

</c:choose>


</body>
</html>