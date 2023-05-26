<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
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
	<title>travelList.jsp</title>
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
	<section>
	<!-- 본문시작 -->
		<div class="container-fluid" style="padding:50px">	
		<h3 align="center">여행내역 조회</h3>
		
			<table class="table table-striped" style="text-align: center">
			<tr>
				<th class="info" style="text-align: center">예약번호</th>
				<th class="info" style="text-align: center">주민번호</th>
				<th class="info" style="text-align: center">성명</th>
				<th class="info" style="text-align: center">성별</th>
				<th class="info" style="text-align: center">전화번호</th>
				<th class="info" style="text-align: center">여행상품</th>
				<th class="info" style="text-align: center">상태</th>
				<th class="info" style="text-align: center">금액</th>
				<th class="info" style="text-align: center">수정/삭제</th>
			</tr>
<%
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
			//out.println("오라클DB 서버 연결 성공");
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT tbl_tourcode_02.tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair ");
			sql.append(" 		,rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat ");
			sql.append(" FROM tbl_tourcode_02 inner join tbl_reserve_01 ");
			sql.append(" ON tbl_tourcode_02.tcode = tbl_reserve_01.tcode ");
			sql.append(" ORDER BY tbl_tourcode_02.tcode");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();		
			
			if(rs.next()){
				do{
%>
					<tr>
						<td><%=rs.getString("rno") %></td>	<!-- 예약번호 -->		
						<td><%=rs.getString("rjumin").substring(0,6)+"-"+rs.getString("rjumin").substring(6) %></td>	<!-- 주민번호 -->
						<td><%=rs.getString("rname") %></td>	<!-- 성명 -->
						<td>
						<!-- <%=rs.getString("rjumin")%> -->
<%
						int code=Integer.parseInt(rs.getString("rjumin").substring(6,7));
						//int rjumin=rs.getString("rjumin").substring(6,7);

						/*
						if(rjumin.equals("1")||rjumin.equals("3")){
							out.print("남자");
						}else if(rjumin.equals("2")||rjumin.equals("4")){
							out.print("여자");
						}//if end
						*/
						
						String gender="";
						switch(code%2) {
						case 0 : gender="여"; break;
						case 1 : gender="남"; break;
						}//switch end
						
						out.print(gender);						
%>
						
						</td>	<!-- 성별 -->	
						<td><%=rs.getString("rphone1")+"-"+rs.getString("rphone2")+"-"+rs.getString("rphone3") %></td>	<!-- 전화번호 -->	
						<td><%=
						rs.getString("tcode")+"-"+rs.getString("tarea") +"-"+rs.getString("tdate")+"-"+rs.getString("ttime")+"/"+rs.getString("thotel")+"/"+rs.getString("tair")
						%></td>	<!-- 여행상품 -->
						<td>
						<!-- <%=rs.getString("rstat") %> -->
<%
						int rstat=Integer.parseInt(rs.getString("rstat"));

						String stat="";
						switch(rstat) {
						case 1 : stat="미납"; break;
						case 2 : stat="완납"; break;
						}//switch end
						
						out.print(stat);
%>
						
						</td>	<!-- 상태 -->
						<td>
						<!-- <%="￦"+rs.getString("tmoney")+"원" %> -->
<%
						
						//NumberFormat numberFormat = NumberFormat.getInstance();
						//money = numberFormat.format(money);
						
						int tmoney = Integer.parseInt(rs.getString("tmoney"));
						DecimalFormat df = new DecimalFormat("###,###");
						String money = df.format(tmoney);
						out.print("￦"+money+"원");
%>
						
						</td>	<!-- 금액 -->
						<td>
							<input class="btn btn-warning" type="button" value="수정" onclick="location.href='travelUpdate.jsp?rno=<%=rs.getString("rno") %>'">
							<input class="btn btn-danger" type="button" value="삭제" onclick="location.href='travelDel.jsp?rno=<%=rs.getString("rno") %>'">
						</td>
					</tr>				
<%					
				}while(rs.next());
			}else{
				out.println("<tr>");
				out.println("	<td colspan='5'>글없음</td>");
				out.println("</tr>");				
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
	</table>
	</div>
	<!-- 본문끝 -->
	</section>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>