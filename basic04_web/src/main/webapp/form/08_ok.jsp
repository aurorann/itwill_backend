<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>

	<h3>＊계산결과＊</h3>
<%

	//한글 인코딩
	request.setCharacterEncoding("UTF-8");//조합형
	
	
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	String op=request.getParameter("op").trim();
	
	int hap1=0;
	double hap2=0;
	
	if(op.equals("+")){
		hap1=num1+num2;
	}else if(op.equals("-")){
		hap1=num1-num2;
	}else if(op.equals("*")){
		hap1=num1*num2;
	}else if(op.equals("/")){
		hap2=(double)num1/num2;
	}else if(op.equals("%")){
		hap1=num1%num2;
	}//if end
%>

	<!-- 출력 -->
	<table class="table table-striped">
	<tr>
		<td><%=num1 %></td>
		<td><%=op %></td>
		<td><%=num2 %></td>
		<td>=</td>
		<td>
<%
			if(op.equals("/")){
				out.print(String.format("%.1f", hap2));
			}else{
				out.print(hap1);
			}//if end
%>
		</td>
	</tr>
	</table>
</body>
</html>