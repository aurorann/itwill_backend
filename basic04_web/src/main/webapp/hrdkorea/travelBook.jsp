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
	<title>travelBook.jsp</title>
	<style>
		header{background: Tan; height: 80px; color:white; text-align: left; line-height: 80px; font-size:30px;}
		nav	  {background: SeaShell; color: gray; text-align: right;}
		footer{background: RosyBrown; color: white; text-align: center; height: 120px; line-height: 120px;}
	</style>
	<script>
		function validate() {
			//유효성 검사
			
			//1)예약번호 글자 갯수가 8글자 인지 확인
			let rno=document.getElementById("rno").value;
			rno=rno.trim();
			if(rno.length!=8){
				alert("예약번호 8글자 입력해 주세요");
				document.getElementById("rno").focus();
				return false;
			}//if end
			
			//2) 상품코드를 선택했는지 확인
			let tcode=document.getElementById("tcode").value;
			tcode=tcode.trim();
			if(tcode.length==0){
				alert("상품코드를 선택해주세요");
				document.getElementById("tcode").focus();
				return false;
			}//if end
			
			//3) 주민번호가 각각 6글자, 7글자 숫자형으로 입력되었는지
			let rjumin1=document.getElementById("rjumin1").value;
			rjumin1=rjumin1.trim();
			if(isNaN(rjumin1) || rjumin1.length!=6){
				alert("주민등록번호 앞 6글자를 입력해주세요");
				document.getElementById("rjumin1").focus();
				return false;
			}//if end

			let rjumin2=document.getElementById("rjumin2").value;
			rjumin2=rjumin2.trim();
			if(isNaN(rjumin2) || rjumin2.length!=7){
				alert("주민등록번호 뒤 7글자를 입력해주세요");
				document.getElementById("rjumin2").focus();
				return false;
			}//if end
			
			//4) 예약자 전화가 숫자형으로 입력되었는지
			let rphone1=document.getElementById("rphone1").value;
			rphone1=rphone1.trim();
			if(isNaN(rphone1) || rphone1.length!=3){
				alert("전화번호를 숫자 3글자로 입력해주세요");
				document.getElementById("rphone1").focus();
				return false;
			}//if end
			
			let rphone2=document.getElementById("rphone2").value;
			rphone2=rphone2.trim();
			if(isNaN(rphone2) || rphone2.length!=4){
				alert("전화번호를 숫자 4글자로 입력해주세요");
				document.getElementById("rphone2").focus();
				return false;
			}//if end
			
			let rphone3=document.getElementById("rphone3").value;
			rphone3=rphone3.trim();
			if(isNaN(rphone3) || rphone3.length!=4){
				alert("전화번호를 숫자 4글자로 입력해주세요");
				document.getElementById("rphone3").focus();
				return false;
			}//if end
			
			//5) 고객이메일에 @문자가 있는지
			let remail=document.getElementById("remail").value;
			remail=remail.trim();
			if(remail.indexOf("@")==-1){
				alert("이메일을 다시 입력해 주세요");
				document.getElementById("remail").focus();
				return false;
			}//if end

			return true; //서버로 전송

		}//validate() end
	</script>
</head>
<body>
	<header class="container-fluid">여행예약 프로그램 ver2018-12</header>
	<nav class="container-fluid">
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	<div align="center" class="container-fluid" style="padding:50px">
	<section>
	<!-- 본문시작 -->
		<form name="travelfrm" id="travelfrm" method="post" action="travelBookProc.jsp" onsubmit="return validate()">
		<table class="table table-striped">
		<tr>
			<th class="info">예약번호</th>
			<td>
				<input type="text" name="rno" id="rno" size="8" maxlength="8" required>
			</td>	
			<td>[JJ01] 제주 2018-12-01 09:30(AM) 출발 - 360,000원 (2박3일)</td>		
		</tr>		
		<tr>
			<th class="info">상품코드</th>
			<td> 
				<select name="tcode" id="tcode">
					<option value="">상품선택</option>
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
			sql.append(" SELECT tcode, tarea, tdate ");
			sql.append(" FROM tbl_tourcode_02 ");
			sql.append(" ORDER BY tcode ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()){
				String tname="";
				do{
					tname += "<option value='"+rs.getString("tcode")+"'>";
					tname += "["+rs.getString("tcode")+"] ";
					tname += rs.getString("tarea")+" ";
					tname += rs.getString("tdate").substring(0,4)+"-";
					tname += rs.getString("tdate").substring(4,6)+"-";
					tname += rs.getString("tdate").substring(6,8);
					tname += " 출발";
					tname += "</option>";
				}while(rs.next());
				
				out.print(tname);
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
				</select> 
			</td>	
			<td>[JJ02] 부산 2018-12-02 10:30(AM) 출발 - 280,000원 (2박3일)</td>		
					
		</tr>
		<tr>
			<th class="info">주민번호</th>
			<td>
				<input type="text" name="rjumin1" id="rjumin1" size="6" maxlength="6" required>			
				-
				<input type="text" name="rjumin2" id="rjumin2" size="7" maxlength="7" required>
			</td>	
			<td>[JJ03] 제주 2018-12-04 10:30(AM) 출발 - 360,000원 (2박3일)</td>					
		</tr>
		<tr>
			<th class="info">예약자성명</th>
			<td>
				<input type="text" name="rname" id="rname" size="20" maxlength="20" required>
			</td>			
			<td>[JJ04] 제주 2018-12-07 11:00(AM) 출발 - 420,000원 (3박4일)</td>
		</tr>
		<tr>
			<th class="info">예약자전화</th>
			<td>
			<input type="text" name="rphone1" id="rphone1" size="3" maxlength="3" required>
			-
			<input type="text" name="rphone2" id="rphone2" size="4" maxlength="4" required>
			-
			<input type="text" name="rphone3" id="rphone3" size="4" maxlength="4" required>
			</td>
			<td>[JJ05] 부산 2018-12-09 13:30(AM) 출발 - 260,000원 (2박3일)</td>			
		</tr>
		<tr>
			<th class="info">고객이메일</th>
			<td>
				<input type="text" name="remail" id="remail" size="30" maxlength="30" required>
			</td>	
			<td>[JJ06] 제주 2018-12-10 09:30(AM) 출발 - 460,000원 (3박4일)</td>		
		</tr>
		<tr>
			<th class="info">결제상태</th>
			<td>
				<input type="radio" name="rstat" id="rstat" value="1" checked> 미납
				<input type="radio" name="rstat" id="rstat" value="2"> 완납
			</td>		
			<td></td>	
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="예약">
				<input type="reset" value="다시쓰기">
			</td>			
		</tr>
		</table>		
		</form>
	<!-- 본문끝 -->
	</section>
	</div>
	<footer>
		HRDKOREA Copyright&copy;2018 All rights reserved.
		Human Resources Development Service of Korea
	</footer>
</body>
</html>