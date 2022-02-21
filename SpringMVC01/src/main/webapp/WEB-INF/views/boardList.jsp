<%@page import="kr.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

 
<div class="container">
  <h2>Sprint WEB MVC01(JSTL+EL)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    <table class = "table table-hover table-bordered">
   <tr>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
      <td>조회수</td>
   </tr>
  <c:forEach var="vo" items="${list}" >
     <tr>
      <td>${vo.idx}</td>
      <td><a href="/myapp/boardContent.do/${vo.idx}">${vo.title}</a></td>
      <td>${vo.writer}</td>
      <td>${vo.indate}</td>
      <td>${vo.count}</td>
   </tr>
   </c:forEach>
   <tr>
   <td colspan="5">
   <button class="btn btn-success btn-sm" onclick="location.href='/myapp/boardForm.do'">글쓰기</button>
   </tr>
   </table>
    
    </div>
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정 2차 배윤서<div>
  </div>
</div>

</body>
</html>
