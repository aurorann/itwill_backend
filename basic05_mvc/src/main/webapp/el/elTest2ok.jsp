<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>EL 파라미터 결과</h3>
	
	1) JSP 방식<br>
	아이디 : <%=request.getParameter("id") %><br>
	비밀번호 : <%=request.getParameter("pw") %><br>
	<hr>
	
	2) EL 방식<br>
	아이디 : ${param.id}<br>
	비밀번호 : ${param.pw}<br> 

</body>
</html>