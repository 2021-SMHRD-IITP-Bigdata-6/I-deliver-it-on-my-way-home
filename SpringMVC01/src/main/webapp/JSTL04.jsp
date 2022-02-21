<%@page import="kr.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%
	//이 부분은 Controller가 하는 부분 (Data를 만드는 부분)
List<Board> list = new ArrayList<Board>();
Board vo = new Board();
vo.setIdx(1);
vo.setTitle("테스트");
vo.setWriter("윤서");
vo.setIndate("2022-01-13");
vo.setCount(7);

list.add(vo);
list.add(vo);
list.add(vo);
request.setAttribute("list", list); //HttpServletRequest
session.setAttribute("list", list); //HttpSession
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
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="vo" items="${requestScope.list}"> <!-- 리퀘스트 list값 가져오기 -->
			<tr>					<!-- sessionScope.list 세션 list값 가져오기 -->
				<td>${vo.idx}</td>
				<td>${vo.title}</td>
				<td>${vo.writer}</td>
				<td>${vo.indate}</td>
				<td>${vo.count}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>