<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
   
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
    background: url("resources/img/nav1.png") ;
    background-size: cover;
}

nav ul li:nth-child(2) a {
    background: url("resources/img/nav2.png") ;
    background-size: cover;
}

nav ul li:nth-child(3) a {
    background: url("resources/img/nav3.png") ;
    background-size: cover;
}

nav ul li:nth-child(4) a {
    background: url("resources/img/nav4.png") ;
    background-size: cover;
}

nav ul li:nth-child(5) a {
    background: url("resources/img/nav5.png") ;
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

   </style>
<nav>
    <ul>
        <li><a href="/"></a></li>
        <li><a href="/store/search"></a></li>
        <li><a href="/likes/store"></a></li>
        <li><a href="/orderList"></a></li>
        <li><a href="/myPage"></a></li>
    </ul>
</nav>