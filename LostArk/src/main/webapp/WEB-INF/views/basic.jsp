<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/practice.js"></script>
<script type="text/javascript">
    $(document).ready(()=>{ // 람다식(*)
       loadList();    
    });    
    
  </script>
</head>
<body>

	<div class="container">
		<h2>Spring WEB MVC02(Ajax+JSON))</h2>
		<div class="panel panel-default">
			<div class="panel-heading">BOARD</div>
			<div class="panel-body" id="list"></div>
			<div class="panel-body" id="wform" style="display: none">

				<form id="frm" class="form-horizontal" >

					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목 :</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="Enter title">
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용 :</label>
						<div class="col-sm-10">
							<textarea rows="10" class="form-control" id= "content" name="content"></textarea>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자 :</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="writer" id="writer"
								placeholder="writer ">
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
							<button type="submit" class="btn btn-warning btn-sm" id="init">취소</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">
				빅데이터 분석 서비스 개발자 과정 2차 배윤서
				<div></div>
			</div>
</body>
</html>
