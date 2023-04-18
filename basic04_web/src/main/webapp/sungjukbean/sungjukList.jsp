<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %> <!--jsp코드 많을시 추천  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
</head>
<body>
	<div class="container-fluid" style="padding:50px">
	<h3 align="center">＊ 성적 목록 ＊</h3>
	<p align="right"><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	
	<table class="table table-striped">
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	
	</tr>
<%
	ArrayList<SungjukDTO> list=dao.list();
	if(list==null){
		out.println("<tr>");
		out.println("	<td colspan ='5'>글없음!!</td>");
		out.println("</tr>");
	}else{
		for(int i=0; i<list.size(); i++){
			dto=list.get(i);//dto에서 가져온 한줄을 dto에 담는다
%>
			<tr>
				<td><a href="sungjukRead.jsp?sno=<%=dto.getSno() %>">
					<%=dto.getUname() %></a></td><%-- dto에 담았기때문에 get함수를 이용하여 가져온다 --%>
				<td><%=dto.getKor() %></td>
				<td><%=dto.getEng() %></td>
				<td><%=dto.getMat() %></td>
				<td><%=dto.getWdate().substring(0, 10) %></td>
			</tr>
<%
		}//for end
	}//if end
%>
	</table>
	</div>
</body>
</html>