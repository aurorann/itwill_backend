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
	<script>
		function order() {
			if (confirm("주문을 진행하시겠습니까?")) {
				location.href='/order/orderform';
			}//if end
		}//order() end
	</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin: auto; width: 550px">
	
	<h3>장바구니 목록</h3>
	
	<table class="table" style="margin: auto;">
		<tr>
			<th>아이디</th>
			<th>번호</th>
			<th>상품코드</th>
			<th>상품가격</th>
			<th>상품수량</th>
			<th>가격</th>
			<th>삭제</th>
		</tr>
		
		<c:forEach items="${list}" var="row">
			<tr>
				<td>${row.id}</td>
				<td>${row.cartno}</td>
				<td>${row.product_code}</td>
				<td>${row.price}</td>
				<td>${row.qty}</td>
				<td>${row.price*row.qty}</td>
				<td>
					<input type="button" value="삭제" onclick="location.href='/cart/delete?cartno=${row.cartno}'">
				</td>
			</tr>		
		</c:forEach>
	</table>
	
	
	<br>
	<input type="button" value="계속 쇼핑하기" onclick="location.href='/product/list'">
	<input type="button" value="주문하기" onclick="order()">
	

	</div>
</body>
</html>