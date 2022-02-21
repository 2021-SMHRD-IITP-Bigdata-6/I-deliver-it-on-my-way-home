<%@page import="kr.smhrd.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("n", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  function delFn(idx) {
	location.href="/myapp/boardDelete.do/"+idx;
	
}
  function updateFn(idx) {
		location.href="/myapp/boardUpdate.do/"+idx;
		
	}
  </script>
</head>
<body>

<div class="container">
  <h2>Spring WEB MVC01(Content JSTL+EL)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD </div>
    <div class="panel-body"> 
    <table class="table table-bordered">
    <tr>
    <td>번호</td>
    <td>${vo.idx}</td>
    </tr>
     <tr>
    <td>제목</td>
    <td>${vo.title}</td>
    </tr>
    <tr>
    <td>내용</td>
    <td>${fn:replace(vo.content,n,"<br>")}</td>
    </tr>
    <tr>
    <td>작성자</td>
    <td>${vo.writer}</td>
    </tr>
    <tr>
    <td>작성일</td>
    <td>${fn:split(vo.indate," ")[0] }</td>
    </tr>
    <tr>
    
    <td colspan="2" align="center">
<button class="btn btn-info btn-sm" onclick="updateFn(${vo.idx})">수정</button>
<button class="btn btn-warning btn-sm" onclick="delFn(${vo.idx})">삭제</button>
<button class="btn btn-success btn-sm" onclick="location.href='/myapp/boardList.do'">리스트</button>
    </td>
    </tr>
    </table>
    </div>
    
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정 2차 배윤서<div>
  </div>
</div>

</body>
</html>
