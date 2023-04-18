<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
    
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
		header{background: Tan; height: 80px; color:white; text-align: center; line-height: 80px;}
		nav	  {background: SeaShell; color: gray; text-align: center;}
		footer{background: RosyBrown; color: white; text-align: center;}
	</style>
</head>
<body>
	<header>여행예약 프로그램 ver2018-12</header>
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<div align="center">
	<section>
	<!-- 본문시작 -->
		<h3>예약등록</h3>
<%	
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 입력한 정보를 가져와서 변수에 담기
	String rno=request.getParameter("rno").trim();
	String tcode=request.getParameter("tcode").trim();
	
	String rjumin1=request.getParameter("rjumin1").trim();
	String rjumin2=request.getParameter("rjumin2").trim();
	String rjumin=rjumin1+rjumin2;
	
	String rname=request.getParameter("rname").trim();
	String rphone1=request.getParameter("rphone1").trim();
	String rphone2=request.getParameter("rphone2").trim();
	String rphone3=request.getParameter("rphone3").trim();
	String remail=request.getParameter("remail").trim();
	String rstat=request.getParameter("rstat").trim();


	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	
	try {
		
		String url 		= "jdbc:oracle:thin:@localhost:1521:xe";
		String user 	= "system";
		String password = "1234";
		String driver 	= "oracle.jdbc.driver.OracleDriver";//ojdbc8.jar
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		
		StringBuilder sql=new StringBuilder();
		sql.append(" INSERT INTO tbl_reserve_01(rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode) ");
		sql.append(" VALUES(?,?,?,?,?,?,?,?,?)");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, rno);
		pstmt.setString(2, rjumin);
		pstmt.setString(3, rname);
		pstmt.setString(4, rphone1);
		pstmt.setString(5, rphone2);
		pstmt.setString(6, rphone3);
		pstmt.setString(7, remail);
		pstmt.setString(8, rstat);
		pstmt.setString(9, tcode);

		
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>예약 입력에 실패하였습니다</p>");
			out.println("<p><a herf='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("	alert('예약이 입력되었습니다');");
			out.println("	location.href='travelList.jsp';");//목록페이지 이동
			out.println("</script>");
		}//if end


	} catch (Exception e) {
		System.out.println("오라클DB 연결 실패"+e);
	} finally{//자원반납(순서주의)	
		
		try {
			if(rs!=null) {rs.close();}
		} catch (Exception e) {}
				
		try {
			if(pstmt!=null) {pstmt.close();}
		} catch (Exception e) {}
		
		try {
			if(con!=null) {con.close();}
		} catch (Exception e) {}
		
	}//end
%>
	
	</section>
	</div>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>































