<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	<%@ include file="" %>				JSP 디렉티브
	<jsp:include page=""></jsp:include>	액션태그
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>home.jsp</title>
	<style>
		header{background: Tan; height: 80px; color:white; text-align: left; line-height: 80px; font-size:30px;}
		nav	  {background: SeaShell; color: gray; text-align: right;}
		footer{background: RosyBrown; color: white; text-align: center; height: 120px; line-height: 120px;}
	</style>
</head>
<body>
	<header class="container-fluid">여행예약 프로그램 ver2018-12</header>
	<nav class="container-fluid">
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<div align="center">
	<section>
	<!-- 본문시작 -->
	<img src="../images/bearggu3.gif">
	<!-- 본문끝 -->
	</section>
	</div>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>