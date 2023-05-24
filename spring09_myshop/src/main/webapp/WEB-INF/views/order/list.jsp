<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<link href="../css/layout.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
	<div class="container-fluid text-center" style="margin: auto; padding: 10%">
	
	<h3>주문 상태</h3>
		<p>
			<button type="button" onclick="location.href='../product/list'" class="btn btn-info">상품전체목록</button>
			<button type="button" onclick="location.href='../cart/list'" class="btn btn-default">장바구니</button>
		</p>
		<div>
			<table class="table" style="margin: auto;">
				<tr>
					<th>주문서번호</th>
					<th>아이디</th>
					<th>총결제금액</th>
					<th>결제구분</th>
					<th>받는사람</th>
					<th>받는주소</th>
					<th>배송메세지</th>
					<th>결제상태</th>
					<th>주문일</th>
				</tr>
				
				<c:forEach items="${list}" var="row">
				<tr>
					<td>${row.orderno}</td>
					<td>${row.id}</td>
					<td>${row.totalamount}</td>
					<td>${row.payment}</td>
					<td>${row.deliverynm}</td>
					<td>${row.deliveryaddr}</td>
					<td>${row.deliverymsg}</td>
					<td>${row.ordercheck}</td>
					<td>${row.orderdate}</td>
				</tr>		
				
			</c:forEach>
				
			</table>
		</div>
	
	</div>

</body>
</html>