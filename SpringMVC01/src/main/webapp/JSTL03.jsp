<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%
	//이 부분은 Controller가 하는 부분 (Data를 만드는 부분)
String[] str = { "사과", "바나나", "오렌지", "포도", "귤" };
request.setAttribute("str", str);
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-borderded table-hover">
		<tr>
			<td>과일목록</td>
		</tr>
		<c:forEach var="f" items="${str}">
			<tr>
				<td>${f}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>