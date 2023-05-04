<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.itwill.bbs.BbsDTO"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bbsResult.jsp</title>
</head>
<body>

	<h3>글쓰기 결과</h3>
	
	1)JSP<br>
<%
	BbsDTO bdto=(BbsDTO)request.getAttribute("dto");
	out.println("작성자 : " + bdto.getWname()+ "<br>");
	out.println("제목 : " + bdto.getSubject()+ "<br>");
	out.println("내용 : " + bdto.getContent()+ "<br>");
	out.println("비번 : " + bdto.getPasswd()+ "<br>");
%>
	<hr>
	
	2)EL<br>
	<!-- BbsDTO클래스에 반드시 getter와 setter함수가 있어야 함 -->
	작성자 : ${dto.wname}<br>
	작성자 : ${dto.subject}<br>
	작성자 : ${dto.content}<br>
	작성자 : ${dto.passwd}<br>


	

</body>
</html>