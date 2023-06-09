<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10_ok.jsp</title>
</head>
<body>

	<h3>＊request 내장객체의 다양한 메소드 결과＊</h3>
<%
	//1)한글 인코딩
	request.setCharacterEncoding("UTF-8");

	//2)사용자가 입력한 정보를 가져오기
	out.print(request.getParameter("uid"));
	out.print("<hr>");
	
	//3)요청한 사용자의 다양한 정보
	out.print(request.getRemoteAddr());//사용자PC의 IP주소
	out.print("<hr>");
	out.print(request.getRemoteHost());
	out.print("<hr>");
	out.print(request.getRemotePort());
	out.print("<hr>");
	/////////////////////////////////////////////////////
	
	// /basic04_web 해당 프로젝트 이름
	out.print(request.getContextPath());
	out.print("<hr>");
	
	//사용자가 요청한 전체 경로의 페이지명 또는 명령어
	// http://localhost:9090/basic04_web/form/10_ok.jsp
	out.print(request.getRequestURL());
	out.print("<hr>");
	
	//사용자가 요청한 페이지명 또는 명령어
	// /basic04_web/form/10_ok.jsp
	out.print(request.getRequestURI());
	out.print("<hr>");
	/////////////////////////////////////////////////////
	
	
	//내부변수
	//request.setAttribute("변수명", 값); 변수명에는 타입이 없음
	//request.getAttribute("변수명");
	request.setAttribute("user", "KOREA");
	out.print(request.getAttribute("user"));
	
	Object obj=request.getAttribute("user");
	String str=(String)obj;//다형성
	out.print(str);
	out.print("<hr>");
	/////////////////////////////////////////////////////
	
	//내컴퓨터 입장에서 /images폴더의 실제 물리적 경로
	out.print(application.getRealPath("/images"));
	out.print("<hr>");
	/*
		아래 경로는 이클립스에서 톰캣서버를 실행 한 경우
		I:\java202301\workspace
					 \.metadata
					 \.plugins
					 \org.eclipse.wst.server.core
					 \tmp0
					 \wtpwebapps
					 \basic04_web
					 \images
	*/

%>

</body>
</html>