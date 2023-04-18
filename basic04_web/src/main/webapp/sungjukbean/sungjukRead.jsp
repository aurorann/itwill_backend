<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukRead.jsp</title>
</head>
<body>
	<div class="container-fluid" style="padding:50px">
	<h3 align="center">＊ 성적 상세보기 ＊</h3>
	<p align="right">
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	int sno=Integer.parseInt(request.getParameter("sno"));

	dto=dao.read(sno);
	
	if(dto==null){
		out.println("해당 글없음");
	}else{
%>
		<table class="table" style="table-layout: fixed">
		<tr>
			<th class="info" width="120px">이름</th>
			<td width="400px"><%=dto.getUname() %></td>
		</tr>
		<tr>
			<th class="info" width="120px">국어</th>
			<td width="400px"><%=dto.getKor() %></td>
		</tr>
		<tr>
			<th class="info" width="120px">영어</th>
			<td width="400px"><%=dto.getEng() %></td>
		</tr>
		<tr>
			<th class="info" width="120px">수학</th>
			<td width="400px"><%=dto.getMat() %></td>
		</tr>
		<tr>
			<th class="info" width="120px">평균</th>
			<td width="400px"><%=dto.getAver() %></td>
		</tr>
		<tr>
			<th class="info" width="120px">주소</th>
			<td width="400px">
			
			<%=dto.getAddr() %>
<%
			//주소를 한글로 출력
			String addr=dto.getAddr();
			if(addr.equals("Seoul")){
				out.print("서울");
			}else if(addr.equals("Busan")){
				out.print("부산");
			}else if(addr.equals("Suwon")){
				out.print("수원");
			}else if(addr.equals("Jeju")){
				out.print("제주");	
			}//if end
%>					
			</td>
		</tr>
		<tr>
			<th class="info" width="120px">작성일</th>
			<td width="400px"><%=dto.getWdate().substring(0, 10) %></td>
		</tr>
		</table>
		
		<br><br>
		<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>
		&nbsp;&nbsp;
		<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>
					
		
<%		
	}//if end
%>
	</div>
</body>
</html>