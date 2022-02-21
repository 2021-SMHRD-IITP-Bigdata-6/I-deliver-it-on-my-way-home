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
 
<!-- $ { } : EL : Expression Language(표현식,출력식) - < %= %>   JSTL+EL -->
<!-- $ { 식  } 으로 쓰이는것   
1. Var 변수
2. 연산자 (산술 , 관계 , 논리 ) 
3. ${속성이름} 자바로 request.setAttribute()로 저장 -->
<%for(int i = 1 ; i<=5;i++){ if (i%2==0){%>
	<font size="<%=i%>">야호<%=i%><br></font>
	<% }}%>
	<!-- 디자이너 를 위한  -->
<c:forEach step="1" begin="1" end="5" var="i" >
<c:if test="${i%2==0}">
 <font size = "${i}"> 야호${i}</font><br> </c:if></c:forEach>
</body>
</html>