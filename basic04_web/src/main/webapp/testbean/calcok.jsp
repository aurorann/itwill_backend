<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.testbean.*" %>

<jsp:useBean id="calc" class="net.testbean.CalBean" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calcok.jsp</title>
</head>
<body>

	<h3>＊ Java Bean 이용한 계산 결과 ＊</h3>
<%
	int num=Integer.parseInt(request.getParameter("num").trim());

	out.print(num+"의 절대값 : "+calc.abs(num));
	out.print("<hr>");
	out.print(num+"의 팩토리얼값 : "+calc.fact(num));
%>
</body>
</html>