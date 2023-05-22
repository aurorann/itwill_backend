<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write.jsp</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<link href="../css/layout.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
</head>
<body>
	<div class="container-fluid" style="margin: auto; width: 600px">
	<h3 class="text-center">상품등록</h3>

	<form name="productfrm" id="productfrm" method="post" action="insert" enctype="multipart/form-data">
		<p align="center">
			<button style="margin-left: 70%" type="button" onclick="location.href='list'" class="btn btn-info">상품전체목록</button>
		</p>
		<table class="table table-condensed" style="margin: auto;">
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품명</td>
	        <td> <input type="text" name="product_name"> </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품가격</td>
	        <td> <input type="number" name="price"> </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="description"></textarea>     
	         </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품사진</td>
	        <td> <input type="file" name="img"> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        	<input type="submit" value="상품등록" class="btn btn-primary">
	        </td>
	    </tr>
	    </table>
	</form>

	</div>
</body>
</html>