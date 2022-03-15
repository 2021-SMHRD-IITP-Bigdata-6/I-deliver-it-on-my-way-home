<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">

<%@ include file="/WEB-INF/view/include/header.jsp" %>

<html>
    <head>
	</head>
	<body>
		
		<table border="1">
			<th> 주문 순번 </th>
			<th> 주문 일자 </th>
			<th> 가게 순번 </th>
			<th> 총주문 금액 </th>
			<th> 결제금액 </th>
			<th> 결제수단 </th>
			<tr>
				<td>작성일자</td>
				<td><fmt:formatDate value="${data.date}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td>글번호</td><td>${data.no}</td>
			</tr>
			<tr>
				<td>이름</td><td>${data.name}</td>
			</tr>
			<tr>
				<td>goal</td><td>${data.goal}</td>
			</tr>
			<tr><td>ID</td><td>${data.id}</td></tr>
		</table>
		<table border="1">
			<th> 주문 순번 </th>
			<th> 주문 일자 </th>
			<th> 가게 순번 </th>
			<th> 총주문 금액 </th>
			<th> 결제금액 </th>
			<th> 결제수단 </th>
			<tr>
				<td>작성일자</td>
				<td><fmt:formatDate value="${data.date}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td>글번호</td><td>${data.no}</td>
			</tr>
			<tr>
				<td>이름</td><td>${data.name}</td>
			</tr>
			<tr>
				<td>goal</td><td>${data.goal}</td>
			</tr>
			<tr><td>ID</td><td>${data.id}</td></tr>
		</table>
	</body>
	</html>
</html>	

  <!-- 하단 메뉴 -->
  <%@ include file="/WEB-INF/view/include/nav.jsp" %>
  <!-- 하단 메뉴 -->

  <!-- 푸터 -->
  <%@ include file="/WEB-INF/view//include/footer.jsp" %>
  <!-- 푸터 -->