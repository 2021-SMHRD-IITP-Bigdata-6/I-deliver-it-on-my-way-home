<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<style>
/* -------------  푸터 ------------- */




footer {
    background-color:#2AC1BC;
    height: 130px;
    font-size: 13px;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
}

footer .box {
	width : 1200px;
	height: 80px;
}

/* -------------  푸터 ------------- */


@media (min-width:768px) and (max-width:1023px) {
}
@media  (max-width:767px) {
	footer {
		height: 100px; 
	}
	
	footer .box {
		width : 90%;
	}

}
header {
	width: 100%;
	height: 80px;
	background: #2AC1BC;
	position: relative;
}

#header {
	width: 1200px;
	margin: 0 auto;
}

header img {
	width: 160px;
}

.menu_tab_box {
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}


.menu_tab, 
.menu_tab span {
	display: inline-block;
	transition: all 0.4s;
	box-sizing: border-box;
}

.menu_tab {
	position: relative;
	width: 24px;
	height: 18px;
	display: none;
	cursor: pointer;
}

.menu_tab span {
	position: absolute;
	left: 0;
	width: 100%;
	height: 2px;
	background-color: #fff;
	border-radius: 4px;
}

.menu_tab span:nth-of-type(1) {
	top: 0;
}

.menu_tab span:nth-of-type(2) {
	top: 50%;
	transform: translateY(-50%);
}

.menu_tab span:nth-of-type(3) {
	bottom: 0;
}

.menu_tab.active span:nth-of-type(1) {
	transform: translateY(8px) rotate(-45deg);
}

.menu_tab.active span:nth-of-type(2) {
	opacity: 0;
}

.menu_tab.active span:nth-of-type(3) {
	transform: translateY(-8px) rotate(45deg);
}

@media ( max-width :1250px) {
	#header {
		width: 99%;
	}
}

@media ( max-width :767px) {
	header img {
		width: 120px;
		position: relative;
		left: -15px;
	}
	header {
		height: 60px;
	}
}
/* 하단 메뉴 */
nav {
    height: 80px;
    border-top:1px solid #ccc;
    position: sticky;
    bottom: 0;
    z-index: 1;
    background: #fff;
}

nav ul {
    display: flex;
    justify-content: space-around;
    padding-top: 10px;
    width: 80%;
    max-width : 1200px;
    margin: 0 auto;
}

nav ul li a {
    display: block;
    width: 60px;
    height: 60px;
    transition: 0.1s;

}

nav ul li:nth-child(1) a {
    background: url("/img/nav1.png") ;
    background-size: cover;
}

nav ul li:nth-child(2) a {
    background: url("/img/nav2.png") ;
    background-size: cover;
}

nav ul li:nth-child(3) a {
    background: url("/img/nav3.png") ;
    background-size: cover;
}

nav ul li:nth-child(4) a {
    background: url("/img/nav4.png") ;
    background-size: cover;
}

nav ul li:nth-child(5) a {
    background: url("/img/nav5.png") ;
    background-size: cover;
}

nav ul li a:hover {
    transform: scale(1.15); 
}


@media (max-width:1023px) {
	nav ul {
	    width: 100%;
	}
}
@media  (max-width:767px) {

    nav {
        height: 65px;
    }

    nav ul li a {
        display: block;
	    width: 45px;
        height: 45px;
    }

}


  


/* 하단 메뉴 */

@charset "UTF-8";

body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset,
	legend, p, select, table, th, td, tr, textarea, button, form {
	margin: 0;
	padding: 0;
}

html {
	font-size: 62.5%
}

input, button, textarea {
	border-radius: 10px;
}

/*  a 링크 초기화 */
a {
	color: #222;
	text-decoration: none;
}

a:hover {
	color: #390;
}

/* 인풋 number 화살표 업애기 */
input[type="number"]::-webkit-outer-spin-button, 
input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
}
/* 스윗 얼럿 */
.swal-footer {
	text-align: center;
}

.swal-button.swal-button--confirm {
	background: #2AC1BC;
	color: #fff;
}

.swal-button.swal-button--cancel {
	background: #fff;
	color: #333333;
	border: 1px solid #ddd;
}
/* 스윗 얼럿 */
h1, h2 {
	/* font-weight: bold; */
	
}

h1 {
	font-size: 2.4rem;
}

h2 {
	font-size: 2rem;
}

h3 {
	font-weight: bold;
	font-size: 1.8rem;
}

i {
	cursor: pointer;
}

button, input[type="submit"], input[type="button"] {
	cursor: pointer;
}

/* 크기 변경 x */
textarea {
	resize: none;
}

/* 폰트 초기화 */
body, input, textarea, select, button, table {
	/* font-family: AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif;  */
	font-family: 'Jua', sans-serif;
	color: #222;
	font-size: 1.6rem;
	line-height: 1.5;
}
/* 폰트 초기화 */

/* 불릿기호 초기화 */
dl, ul, ol, li, menu {
	list-style: none;
}


input:focus {
	outline: none;
}

select{
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border-radius: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
}



@media ( max-width :767px) {
	html {
		font-size: 56%;
	}
}

@media ( max-width :480px) {
	html {
		font-size: 45%;
	}
}

@media ( max-width :767px) {
	input[type="submit"], input[type="button"], textarea, button, select {
		appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
		border-radius: 0;
		-webkit-border-radius: 0;
		-moz-border-radius: 0;
	}
}
</style>
<html>
<head>
    <meta charset="UTF-8">
    <title>배민</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1" >
  

    <!-- 제이쿼리 -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 스윗얼럿 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- 폰트 어썸 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
        integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

    <!-- 배민 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <!-- 파비콘 -->
    <link href="/img/baemin_favicon.png" rel="shortcut icon" type="image/x-icon">